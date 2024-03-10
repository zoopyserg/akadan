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

// Adjusted fetch_records to include the name in the SELECT query
Record* fetch_records(int *num_records) {
    const char *connection = "dbname=journal_development user=diamondserge password=112223 host=localhost";
    PGconn *conn = PQconnectdb(connection);

    if (PQstatus(conn) == CONNECTION_BAD) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }

    // Include 'name' in the SELECT
    PGresult *res = PQexec(conn, "SELECT id, user_id, is_public, record_type_id, name, solved, rank, progress FROM records");

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
        records[i].isSolved = PQgetvalue(res, i, 5)[0] == 't';
        records[i].rank = atof(PQgetvalue(res, i, 6));
        records[i].progress = atof(PQgetvalue(res, i, 7));
    }

    PQclear(res);
    PQfinish(conn);

    return records;
}

// enough for roughly 50k records
#define MAX_BUFFER_SIZE (100 * 1024 * 1024) // 1MB for the whole query, should be more than enough
#define EXCLUDED_IDS_BUFFER_SIZE (100 * 500) // Enough for the excluded IDs list per record
#define VALUE_BUFFER_SIZE (100 * 1024) // 1KB for each record's portion of the query

void save_records(Record *records, int num_records) {
    const char *conninfo = "dbname=journal_development user=diamondserge password=112223 host=localhost";
    PGconn *conn = PQconnectdb(conninfo);
    if (PQstatus(conn) != CONNECTION_OK) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        return;
    }

    char *query = malloc(MAX_BUFFER_SIZE); // Adjust buffer size as needed
    if (!query) {
        fprintf(stderr, "Memory allocation failed for query buffer\n");
        PQfinish(conn);
        return;
    }

    // Start constructing the query
    snprintf(query, MAX_BUFFER_SIZE,
             "UPDATE records SET solved = data.solved, rank = data.rank, progress = data.progress, should_solve = data.should_solve, excluded_ids = data.excluded_ids FROM (VALUES ");

    for (int i = 0; i < num_records; i++) {
        // Construct the comma-separated string of excluded record IDs for this record
        char excludedIds[EXCLUDED_IDS_BUFFER_SIZE] = {0}; // Adjust size as needed
        for (int j = 0; j < records[i].excludedCount; j++) {
            char idBuffer[20]; // Assuming an ID won't exceed this length
            int recordDbId = records[records[i].excludedRecordBs[j]].id; // Convert index to database ID
            snprintf(idBuffer, sizeof(idBuffer), "%d,", recordDbId);
            strncat(excludedIds, idBuffer, sizeof(excludedIds) - strlen(excludedIds) - 1);
        }
        if (records[i].excludedCount > 0) {
            excludedIds[strlen(excludedIds) - 1] = '\0'; // Remove trailing comma
        }

        // Add record update data to the query
        char valueBuffer[VALUE_BUFFER_SIZE]; // Adjust buffer size as needed
        snprintf(valueBuffer, sizeof(valueBuffer),
                 "(%d, %s, %f, %f, %s, '%s')%s",
                 records[i].id,
                 records[i].isSolved ? "TRUE" : "FALSE",
                 records[i].rank,
                 records[i].progress,
                 records[i].shouldSolve ? "TRUE" : "FALSE",
                 excludedIds,
                 i < num_records - 1 ? ", " : "");
        strncat(query, valueBuffer, MAX_BUFFER_SIZE - strlen(query) - 1);
    }

    // Finish constructing the query
    strncat(query, ") AS data(id, solved, rank, progress, should_solve, excluded_ids) WHERE records.id = data.id;",
            MAX_BUFFER_SIZE - strlen(query) - 1);

    // Execute the SQL query
    PGresult *res = PQexec(conn, query);
    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        fprintf(stderr, "UPDATE command failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        free(query);
        return;
    }

    // Clean up
    PQclear(res);
    PQfinish(conn);
    free(query);
}
