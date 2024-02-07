#include "record.h"

// Function to create a record
Record create_record(int id, int userId, bool isPublic, int recordTypeId) {
    Record newRecord;
    newRecord.id = id;
    newRecord.userId = userId;
    newRecord.isPublic = isPublic;
    newRecord.recordTypeId = recordTypeId;
    // Initialize other fields as needed
    return newRecord;
}

// Function to display a record (for demonstration/testing)
void display_record(Record record) {
    printf("Record ID: %d\n", record.id);
    printf("User ID: %d\n", record.userId);
    printf("Is Public: %d\n", record.isPublic);
    printf("Record Type ID: %d\n", record.recordTypeId);
    // Display other fields as needed
}

// Function to fetch the records from the DB:
const char *connection = "dbname=journal_development user=diamondserge password=112223 host=localhost";

Record* fetch_records(int *num_records) {
    PGconn *conn = PQconnectdb(connection);

    if (PQstatus(conn) == CONNECTION_BAD) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }

    PGresult *res = PQexec(conn, "SELECT id, user_id, is_public, record_type_id FROM records");

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "SELECT failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    int nrows = PQntuples(res);
    int capacity = 100;  // initial capacity
    Record *records = malloc(capacity * sizeof(Record));
    if (!records) {
        // handle memory allocation error
        exit(1);
    }

    *num_records = 0; // Counter for actual number of records
    for (int i = 0; i < nrows; i++) {
        if (*num_records == capacity) {
            capacity *= 2; // double the capacity
            records = realloc(records, capacity * sizeof(Record));
            if (!records) {
                // handle memory allocation error
                exit(1);
            }
        }
        records[*num_records] = create_record(
            atoi(PQgetvalue(res, i, 0)),
            atoi(PQgetvalue(res, i, 1)),
            PQgetvalue(res, i, 2)[0] == 't',
            atoi(PQgetvalue(res, i, 3))
        );
        (*num_records)++;
    }

    PQclear(res);
    PQfinish(conn);

    return records;
}
