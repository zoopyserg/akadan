#ifndef RECORD_H
#define RECORD_H

#include "common.h"

typedef struct Record {
    int id;
    char name[1024];
    int userId;
    bool isPublic;
    int recordTypeId;
    bool separateProject;
    int recordsConnectedCached;
    int solvedRecordsConnectedCached;
    int unsolvedRecordsConnectedCached;
    int progressCached;
    float rank;
} Record;

// Function declarations
Record create_record(int id, int userId, bool isPublic, int recordTypeId);
void display_record(Record record);
Record* fetch_records(int *num_records);

#endif // RECORD_H
