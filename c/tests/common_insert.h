#ifndef COMMON_INSERT_H
#define COMMON_INSERT_H

#include <libpq-fe.h>

char* common_insert(char* table, char* columns[], char* values[]);

#endif // COMMON_INSERT_H
