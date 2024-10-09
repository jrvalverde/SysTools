#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdint.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>

/* Return nonzero if the buffer is all zeros.
*/
static inline int is_zero(const void *const ptr, const size_t len)
{
    const char       *p = (const char *)ptr;
    const char *const q = (const char *const)ptr + len;

    while (p < q)
        if (*(p++))
            return 0;

    return 1;
}

/* Return 0 if success, errno error code otherwise.
 *   (*sizeptr):       File size in bytes
 *   (*blocksizeptr):  File block size in bytes
 *   (*storedptr):     Bytes stored on disk
 *   (*sparseptr):     Bytes in sparse holes
 *   (*zeroedptr):     Unnecessarily stored zero bytes
 * If zeroedptr is NULL, the file is only opened and
 * statistics obtained via fstat(). Otherwise, the entire
 * file will be read.
 * Special errors:
 *   EINVAL: NULL or empty file name
 *   EISDIR: Name refers to a directory
 *   EISNAM: Name refers to a pipe or device
 *   EBUSY:  File was modified during read
*/
int examine(const char *const filename,
            uint64_t *const sizeptr,
            uint64_t *const blocksizeptr,
            uint64_t *const storedptr,
            uint64_t *const sparseptr,
            uint64_t *const zeroedptr)
{
    struct stat  info;
    int          fd, result;
    size_t       size, have;
    uint64_t     total, nonzero, stored;
    int          cause = 0;
    char        *data = NULL;

    /* Check for NULL or empty filename. */
    if (!filename || !*filename)
        return errno = EINVAL;

    /* Open the specified file. */
    do {
        fd = open(filename, O_RDONLY | O_NOCTTY);
    } while (fd == -1 && errno == EINTR);
    if (fd == -1)
        return errno;

    do {

        /* Obtain file statistics. */
        if (fstat(fd, &info) == -1) {
            cause = errno;
            break;
        }

        /* Count total, rounding up to next multiple of block size. */
        total = (uint64_t)info.st_size;
        if (total % (uint64_t)info.st_blksize)
            total += (uint64_t)info.st_blksize - ((uint64_t)total % (uint64_t)info.st_blksize);
        /* Count total stored bytes. */
        stored = (uint64_t)512 * (uint64_t)info.st_blocks;

        /* Fill in immediately known fields. */
        if (sizeptr)
            *sizeptr = (uint64_t)info.st_size;
        if (blocksizeptr)
            *blocksizeptr = (uint64_t)info.st_blksize;
        if (storedptr)
            *storedptr = stored;
        if (sparseptr) {
            if (total > stored)
                *sparseptr = total - stored;
            else
                *sparseptr = 0;
        }
        if (zeroedptr)
            *zeroedptr = 0;

        /* Verify we have a regular file. */
        if (S_ISDIR(info.st_mode)) {
            cause = EISDIR;
            break;
        } else
        if (!S_ISREG(info.st_mode)) {
            cause = EISNAM;
            break;
        }

        /* Verify we have a valid block size. */
        if (info.st_blksize < (blksize_t)1) {
            cause = ENOTSUP;
            break;
        }

        /* If zeroedptr is NULL, we do not need to read the file. */
        if (!zeroedptr) {
            /* Close descriptor and return success. */
            do {
                result = close(fd);
            } while (result == -1 && errno == EINTR);
            if (result == -1)
                return errno;
            return 0;
        }

        /* Use large enough chunks for I/O. */
        if (info.st_blksize < (blksize_t)131072) {
            const size_t chunks = (size_t)131072 / (size_t)info.st_blksize;
            size = chunks * (size_t)info.st_blksize;
        } else
            size = (size_t)info.st_blksize;

        /* Allocate buffer. */
        data = malloc(size);
        if (!data) {
            cause = ENOMEM;
            break;
        }

        /* Clear counters. */
        total = 0;
        nonzero = 0;
        have = 0;

        /* Read loop. */
        while (1) {
            size_t  i;
            ssize_t bytes;
            int     ended = 0;

            while (have < (size_t)info.st_blksize) {

                bytes = read(fd, data + have, size - have);
                if (bytes > (ssize_t)0) {
                    have += bytes;
                    total += (uint64_t)bytes;
                } else
                if (bytes == (ssize_t)0) {
                    /* Clear the end of the buffer; just to be sure */
                    memset(data + have, 0, size - have);
                    ended = 1;
                    break;
                } else
                if (bytes != (ssize_t)-1) {
                    cause = EIO;
                    break;
                } else
                if (errno != EINTR) {
                    cause = errno;
                    break;
                }
            }

            if (cause)
                break;

            /* Count number of zero/nonzero chunks in buffer, but add up as bytes. */
            i = have / (size_t)info.st_blksize;
            while (i-->0)
                if (!is_zero(data + i * (size_t)info.st_blksize, (size_t)info.st_blksize))
                    nonzero += (uint64_t)info.st_blksize;

            /* Followed by a partial chunk? */
            {   const size_t overlap = have % (size_t)info.st_blksize;
                if (overlap) {
                    if (have > overlap)
                        memcpy(data, data + have - overlap, overlap);
                    have = overlap;
                } else
                    have = 0;
            }

            /* Next round of the loop, unless end of input. */
            if (!ended)
                continue;

            /* Entire file has been processed. */

            /* Partial chunk in buffer? */
            if (have) {
                if (!is_zero(data, have))
                    nonzero += (uint64_t)info.st_blksize;
            }

            /* If file size changed, update statistics. */
            if (total != (uint64_t)info.st_size) {
                if (fstat(fd, &info) == -1) {
                    cause = errno;
                    break;
                }
                /* File changed from under us? */
                if (total != (uint64_t)info.st_size) {
                    cause = EBUSY;
                    break;
                }
            }

            /* Align total size to (next) multiple of block size. */
            if (total % (uint64_t)info.st_blksize)
                total += (uint64_t)info.st_blksize - (total % (uint64_t)info.st_blksize);

            /* Bytes stored on disk. */
            stored = (uint64_t)512 * (uint64_t)info.st_blocks;

            /* Sanity check. (File changed while we read it?) */
            if (stored > total || nonzero > stored) {
                cause = EBUSY;
                break;
            }

            /* Update fields. */
            if (sizeptr)
                *sizeptr = (uint64_t)info.st_size;
            if (storedptr)
                *storedptr = (uint64_t)512 * (uint64_t)info.st_blocks;
            if (sparseptr)
                *sparseptr = total - stored;
            if (zeroedptr)
                *zeroedptr = (total - nonzero) - (total - stored);

            /* Discard buffer. */
            free(data);

            /* Close file and return. */
            do {
                result = close(fd);
            } while (result == -1 && errno == EINTR);
            if (result == -1)
                return errno;
            return 0;
        }
    } while (0);

    /* Free buffer, if allocated. free(NULL) is safe. */
    free(data);

    /* Close file, and return with cause. */
    do {
        result = close(fd);
    } while (result == -1 && errno == EINTR);
    return errno = cause;
}

#ifdef DEBUG
#include <stdio.h>

int main(int argc, char **argv) {
    char *filename;
    struct stat  info;
    long unsigned int total_blocks, stored_bytes, 
        stored_blocks, sparse_blocks, zeroed_blocks;
    long unsigned int file_bytes, block_size, bytes_stored, bytes_sparse, bytes_zeroed;
    int result;

    if (argc < 2)  {
        printf("usage: %s {filename}\n\n", argv[0]);
        exit(0);
    }
    filename = argv[1];

    /* Number of filesystem blocks for the file */
    total_blocks = info.st_size / info.st_blksize
                 + (info.st_size % info.st_blksize) ? 1 : 0;

    /* Number of bytes stored for the file */
    stored_bytes = 512 * info.st_blocks;

    /* Number of filesystem blocks used for file data */
    stored_blocks = stored_bytes / info.st_blksize
                  + (stored_bytes % info.st_blksize) ? 1 : 0;

    /* Number of sparse blocks */
    sparse_blocks = total_blocks - stored_blocks;

    /*       count zero_blocks,
     *       by reading file in info.st_blksize chunks,
     *       and saving the number of all-zero chunks
     *       in zero_blocks. */
    result =
    examine(filename, 
            &file_bytes, &block_size,
            &bytes_stored, &bytes_sparse,
            &bytes_zeroed);

    if (result != 0) printf("EXAMINE returned %d\n", result);

    /* Number of stored zero blocks */
    zeroed_blocks = (bytes_zeroed/block_size) - sparse_blocks;
    
    printf("%s: size=%lu blksz=%lu sbytes=%lu zbytes=%lu sblocks=%lu zblocks=%lu\n",
    	filename, file_bytes, block_size, 
        bytes_sparse, bytes_zeroed, zeroed_blocks, sparse_blocks);

    return zeroed_blocks;
}
#endif
