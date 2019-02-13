        #define _GNU_SOURCE
        #include <stdio.h>
        #include <dlfcn.h>

        /*
         * crypt-mixup.c, Buffer up crypt() result to return later on.
         */

        // Pointer to the original crypt() call
        static char *(*_crypt)(const char *key, const char *salt) = NULL;

        // Pointer to crypt() previous result
        static char *crypt_res = NULL;

        /*
         * crypt, Crooked crypt function
         */

        char *crypt(const char *key, const char *salt) {

            // Initialize of _crypt(), if needed.
            if (_crypt == NULL) {
                _crypt = (char *(*)(const char *key, const char *salt)) dlsym(RTLD_NEXT, "crypt");
                crypt_res = NULL;
            }

            // No previous result, continue as normal crypt()
            if (crypt_res == NULL) {
                crypt_res = _crypt(key, salt);
                return crypt_res;
            }
        
            // We already got result buffered up!
            _crypt = NULL;
            return crypt_res;
        }
