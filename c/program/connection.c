#include "connection.h"

// Function to create a connection
Connection create_connection(int id, const char* name, int userId, bool isPublic, int recordAId, int recordBId, int connectionTypeId, int* groupId) {
    Connection newConnection;
    newConnection.id = id;
    strncpy(newConnection.name, name, sizeof(newConnection.name) - 1);
    newConnection.name[sizeof(newConnection.name) - 1] = '\0'; // Ensure null-termination
    newConnection.userId = userId;
    newConnection.isPublic = isPublic;
    newConnection.recordAId = recordAId;
    newConnection.recordBId = recordBId;
    newConnection.connectionTypeId = connectionTypeId;
    newConnection.groupId = groupId; // Direct assignment of the pointer
    return newConnection;
}

// Function to display a connection (for demonstration/testing)
void display_connection(Connection connection) {
    char buffer[12]; // Sufficient to hold any 32-bit integer, plus null terminator

    printf("Connection ID: %d\n", connection.id);
    printf("Name: %s\n", connection.name);
    printf("User ID: %d\n", connection.userId);
    printf("Is Public: %d\n", connection.isPublic);
    printf("Record A ID: %d\n", connection.recordAId);
    printf("Record B ID: %d\n", connection.recordBId);
    printf("Connection Type ID: %d\n", connection.connectionTypeId);
    if (connection.groupId) {
        sprintf(buffer, "%d", *connection.groupId);
        printf("Group ID: %s\n", buffer);
    } else {
        printf("Group ID: null\n");
    }
}

// Fetch connections from the database
Connection* fetch_connections(int *num_connections) {
    const char *connectionStr = "dbname=journal_development user=diamondserge password=112223 host=localhost";
    PGconn *conn = PQconnectdb(connectionStr);

    if (PQstatus(conn) == CONNECTION_BAD) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }

    PGresult *res = PQexec(conn, "SELECT id, name, user_id, is_public, record_a_id, record_b_id, connection_type_id, group_id FROM connections");

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "SELECT failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    int nrows = PQntuples(res);
    *num_connections = 0;
    Connection *connections = (Connection*)malloc(nrows * sizeof(Connection));
    if (!connections) {
        PQclear(res);
        PQfinish(conn);
        exit(1); // Memory allocation failed
    }

    for (int i = 0; i < nrows; i++) {
        connections[i] = create_connection(
            atoi(PQgetvalue(res, i, 0)), // id
            PQgetvalue(res, i, 1), // name
            atoi(PQgetvalue(res, i, 2)), // userId
            PQgetvalue(res, i, 3)[0] == 't', // isPublic
            atoi(PQgetvalue(res, i, 4)), // recordAId
            atoi(PQgetvalue(res, i, 5)), // recordBId
            atoi(PQgetvalue(res, i, 6)), // connectionTypeId
            PQgetisnull(res, i, 7) ? NULL : str_to_int_ptr(PQgetvalue(res, i, 7)) // groupId, handling possible NULL
        );
        (*num_connections)++;
    }

    PQclear(res);
    PQfinish(conn);

    return connections;
}
