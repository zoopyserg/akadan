#include "record_type.h"

// Function to create a record type
RecordType create_record_type(int id, int userId, const char* name, bool isPublic) {
    RecordType newRecordType;
    newRecordType.id = id;
    newRecordType.userId = userId;
    strncpy(newRecordType.name, name, sizeof(newRecordType.name) - 1);
    newRecordType.name[sizeof(newRecordType.name) - 1] = '\0'; // Ensure null-termination
    newRecordType.isPublic = isPublic;
    return newRecordType;
}

// Function to display a record type (for demonstration/testing)
void display_record_type(RecordType recordType) {
    printf("Record Type ID: %d\n", recordType.id);
    printf("User ID: %d\n", recordType.userId);
    printf("Name: %s\n", recordType.name);
    printf("Is Public: %d\n", recordType.isPublic);
}

// Fetch record types from the database
RecordType* fetch_record_types(int *num_record_types) {
    const char *connection = "dbname=journal_development user=diamondserge password=112223 host=localhost";
    PGconn *conn = PQconnectdb(connection);

    if (PQstatus(conn) == CONNECTION_BAD) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }

    PGresult *res = PQexec(conn, "SELECT id, user_id, name, is_public FROM record_types");

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "SELECT failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    int nrows = PQntuples(res);
    int capacity = 100; // initial capacity
    RecordType *recordTypes = malloc(capacity * sizeof(RecordType));
    if (!recordTypes) {
        // handle memory allocation error
        exit(1);
    }

    *num_record_types = 0; // Counter for actual number of record types
    for (int i = 0; i < nrows; i++) {
        if (*num_record_types == capacity) {
            capacity *= 2; // double the capacity
            recordTypes = realloc(recordTypes, capacity * sizeof(RecordType));
            if (!recordTypes) {
                // handle memory allocation error
                exit(1);
            }
        }
        recordTypes[*num_record_types] = create_record_type(
            atoi(PQgetvalue(res, i, 0)),
            atoi(PQgetvalue(res, i, 1)),
            PQgetvalue(res, i, 2),
            PQgetvalue(res, i, 3)[0] == 't'
        );
        (*num_record_types)++;
    }

    PQclear(res);
    PQfinish(conn);

    return recordTypes;
}
