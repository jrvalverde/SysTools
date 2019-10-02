/*
 * mktape.c
 */


#include <stdio.h>
#include <stdlib.h>


void error(char *msg) {
  printf("**** Error: %s ****\n", msg);
  exit(0);
}


void writeCount(long count, FILE *file) {
  if (fwrite(&count, 4, 1, file) != 1) {
    error("cannot write byte count");
  }
}


int main(int argc, char **argv) {
  FILE *outfile;
  FILE *infile;
  long size;
  int blocksize;
  int blocks;
  int i, j, k;
  unsigned char buffer[20000];

  /* process command line */
  if (argc < 3) {
    error("Usage: mktape input blocksize output");
  }
  blocksize = atoi(argv[2]);
  if ((blocksize == 0) || ((blocksize % 512) != 0)) {
    error("Block size must be a multiple of 512");
  }

  outfile = fopen(argv[3], "wb");
  if (outfile == NULL) {
    error("cannot open output file");
  }

    printf("%s: ", argv[1]);
    infile = fopen(argv[1], "rb");
    if (infile == NULL) {
      error("cannot open input file");
    }
    fseek(infile, 0, SEEK_END);
    size = ftell(infile);
    fseek(infile, 0, SEEK_SET);
    blocks = size / blocksize;
    printf("%ld bytes = %d records (blocksize %d bytes)\n",
           size, blocks, blocksize);
    if (size % blocksize != 0) {
 /*     error("file size is not a multiple of block size"); */
    }
    for (j = 0; j <= blocks; j++) {
      for (k = 0; k < 20000; k++) buffer[k] = '\0';
      if (fread(buffer, blocksize, 1, infile) != 1) {
        /* error("cannot read input file"); */
      }
      writeCount(blocksize, outfile);
      if (fwrite(buffer, blocksize, 1, outfile) != 1) {
        error("cannot write output file");
      }
      writeCount(blocksize, outfile);
    }
    fclose(infile);
    writeCount(0, outfile);

  writeCount(0, outfile);
  fclose(outfile);
  return 0;
}
