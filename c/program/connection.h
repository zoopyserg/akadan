#ifndef CONNECTION_H
#define CONNECTION_H

#include "common.h"

typedef struct Connection {
    int id;
    char name[1024];
    int userId;
    bool isPublic;
    int recordAId;
    int recordBId;
    int connectionTypeId;
    int* groupId; // Using pointer to handle NULL values
} Connection;

// Function declarations
Connection create_connection(int id, const char* name, int userId, bool isPublic, int recordAId, int recordBId, int connectionTypeId, int* groupId);
void display_connection(Connection connection);
Connection* fetch_connections(int *num_connections);

#endif // CONNECTION_H
