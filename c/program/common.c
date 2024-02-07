#include "common.h"

// Implementation of str_to_int_ptr
int* str_to_int_ptr(const char* str) {
    if (str && str[0]) { // Check if string is not NULL and not empty
        int* val = malloc(sizeof(int));
        if (val) {
            *val = atoi(str);
            return val;
        }
    }
    return NULL;
}
