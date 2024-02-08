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

// Adjusted fetch_records to include the name in the SELECT query
Record* fetch_records(int *num_records) {
    PGconn *conn = PQconnectdb(connection);

    if (PQstatus(conn) == CONNECTION_BAD) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }

    // Include 'name' in the SELECT
    PGresult *res = PQexec(conn, "SELECT id, user_id, is_public, record_type_id, name FROM records");

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "SELECT failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    int nrows = PQntuples(res);
    Record *records = malloc(nrows * sizeof(Record)); // Assuming you'll not exceed initial capacity for simplicity
    if (!records) {
        // handle memory allocation error
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    *num_records = nrows;
    for (int i = 0; i < nrows; i++) {
        records[i].id = atoi(PQgetvalue(res, i, 0));
        records[i].userId = atoi(PQgetvalue(res, i, 1));
        records[i].isPublic = PQgetvalue(res, i, 2)[0] == 't';
        records[i].recordTypeId = atoi(PQgetvalue(res, i, 3));
        strncpy(records[i].name, PQgetvalue(res, i, 4), sizeof(records[i].name) - 1);
        records[i].name[sizeof(records[i].name) - 1] = '\0'; // Ensure null termination
    }

    PQclear(res);
    PQfinish(conn);

    return records;
}
