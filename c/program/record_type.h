#ifndef RECORD_TYPE_H
#define RECORD_TYPE_H

#include "common.h"

typedef struct RecordType {
    int id;
    int userId;
    char name[1024]; // Adjust size as needed
    bool isPublic;
} RecordType;

// Function declarations
RecordType create_record_type(int id, int userId, const char* name, bool isPublic);
void display_record_type(RecordType recordType);
RecordType* fetch_record_types(int *num_record_types);

#endif // RECORD_TYPE_H
