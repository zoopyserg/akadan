#include "connection_type.h"

// Ensure this matches your updated structure and function declarations
ConnectionType create_connection_type(int id, int userId, const char* name, bool isPublic, bool isDirectional, bool isDestructive, const char* targetType, int* targetRecordTypeId, int* targetRecordSubtypeId, const char* targetHierarchy, int* closestParentTypeId, bool oneToMany) {
    ConnectionType newConnectionType;
    newConnectionType.id = id;
    newConnectionType.userId = userId;
    strncpy(newConnectionType.name, name, sizeof(newConnectionType.name) - 1);
    newConnectionType.name[sizeof(newConnectionType.name) - 1] = '\0';
    newConnectionType.isPublic = isPublic;
    newConnectionType.isDirectional = isDirectional;
    newConnectionType.isDestructive = isDestructive;
    strncpy(newConnectionType.targetType, targetType, sizeof(newConnectionType.targetType) - 1);
    newConnectionType.targetType[sizeof(newConnectionType.targetType) - 1] = '\0';
    newConnectionType.targetRecordTypeId = targetRecordTypeId;
    newConnectionType.targetRecordSubtypeId = targetRecordSubtypeId;
    strncpy(newConnectionType.targetHierarchy, targetHierarchy, sizeof(newConnectionType.targetHierarchy) - 1);
    newConnectionType.targetHierarchy[sizeof(newConnectionType.targetHierarchy) - 1] = '\0';
    newConnectionType.closestParentTypeId = closestParentTypeId;
    newConnectionType.oneToMany = oneToMany;
    return newConnectionType;
}

void display_connection_type(ConnectionType connectionType) {
    char buffer[12]; // Sufficient to hold any 32-bit integer, plus null terminator

    printf("Connection Type ID: %d\n", connectionType.id);
    printf("User ID: %d\n", connectionType.userId);
    printf("Name: %s\n", connectionType.name);
    printf("Is Public: %d\n", connectionType.isPublic);
    printf("Is Directional: %d\n", connectionType.isDirectional);
    printf("Is Destructive: %d\n", connectionType.isDestructive);
    printf("Target Type: %s\n", connectionType.targetType);

    if (connectionType.targetRecordTypeId) {
        sprintf(buffer, "%d", *connectionType.targetRecordTypeId);
        printf("Target Record Type ID: %s\n", buffer);
    } else {
        printf("Target Record Type ID: null\n");
    }

    if (connectionType.targetRecordSubtypeId) {
        sprintf(buffer, "%d", *connectionType.targetRecordSubtypeId);
        printf("Target Record Subtype ID: %s\n", buffer);
    } else {
        printf("Target Record Subtype ID: null\n");
    }

    printf("Target Hierarchy: %s\n", connectionType.targetHierarchy);

    if (connectionType.closestParentTypeId) {
        sprintf(buffer, "%d", *connectionType.closestParentTypeId);
        printf("Closest Parent Type ID: %s\n", buffer);
    } else {
        printf("Closest Parent Type ID: null\n");
    }

    printf("One To Many: %d\n", connectionType.oneToMany);
}

ConnectionType* fetch_connection_types(int *num_connection_types) {
    const char *connection = "dbname=journal_development user=diamondserge password=112223 host=localhost";
    PGconn *conn = PQconnectdb(connection);

    if (PQstatus(conn) == CONNECTION_BAD) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }

    PGresult *res = PQexec(conn, "SELECT id, user_id, name, is_public, directional, destructive, target_type, target_record_type_id, target_record_subtype_id, target_hierarchy, closest_parent_type_id, one_to_many FROM connection_types");

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "SELECT failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    int nrows = PQntuples(res);
    *num_connection_types = 0;
    int capacity = 100; // initial capacity
    ConnectionType *connectionTypes = malloc(capacity * sizeof(ConnectionType));
    if (!connectionTypes) {
        PQclear(res);
        PQfinish(conn);
        exit(1); // handle memory allocation error
    }

    for (int i = 0; i < nrows; i++) {
        if (*num_connection_types == capacity) {
            capacity *= 2; // double the capacity
            connectionTypes = realloc(connectionTypes, capacity * sizeof(ConnectionType));
            if (!connectionTypes) {
                PQclear(res);
                PQfinish(conn);
                exit(1); // handle memory allocation error
            }
        }
        connectionTypes[*num_connection_types] = create_connection_type(
            atoi(PQgetvalue(res, i, 0)),
            atoi(PQgetvalue(res, i, 1)),
            PQgetvalue(res, i, 2),
            PQgetvalue(res, i, 3)[0] == 't',
            PQgetvalue(res, i, 4)[0] == 't',
            PQgetvalue(res, i, 5)[0] == 't',
            PQgetvalue(res, i, 6),
            PQgetisnull(res, i, 7) ? NULL : str_to_int_ptr(PQgetvalue(res, i, 7)),
            PQgetisnull(res, i, 8) ? NULL : str_to_int_ptr(PQgetvalue(res, i, 8)),
            PQgetvalue(res, i, 9),
            PQgetisnull(res, i, 10) ? NULL : str_to_int_ptr(PQgetvalue(res, i, 10)),
            PQgetvalue(res, i, 11)[0] == 't'
        );

        (*num_connection_types)++;
    }

    PQclear(res);
    PQfinish(conn);

    return connectionTypes;
}
