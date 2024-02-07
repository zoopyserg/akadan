#ifndef CONNECTION_TYPE_H
#define CONNECTION_TYPE_H

#include "common.h"

typedef struct ConnectionType {
    int id;
    int userId;
    char name[1024]; // Adjust size as needed
    bool isPublic;
    bool isDirectional;
    bool isDestructive;
    char targetType[256]; // Adjust size as needed
    int* targetRecordTypeId; // Use pointer to allow NULL
    int* targetRecordSubtypeId; // Use pointer to allow NULL
    char targetHierarchy[256]; // Adjust size as needed
    int* closestParentTypeId; // Use pointer to allow NULL
    bool oneToMany;
} ConnectionType;

ConnectionType create_connection_type(int id, int userId, const char* name, bool isPublic, bool isDirectional, bool isDestructive, const char* targetType, int* targetRecordTypeId, int* targetRecordSubtypeId, const char* targetHierarchy, int* closestParentTypeId, bool oneToMany);
void display_connection_type(ConnectionType connectionType);
ConnectionType* fetch_connection_types(int *num_connection_types);

#endif // CONNECTION_TYPE_H
