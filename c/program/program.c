#include "record.h"
#include "connection.h"
#include "connection_type.h"
#include "record_type.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

int main() {
    // Create and display a record for testing
    // Record myRecord = create_record(1, 100, true, 2);
    // display_record(myRecord);

    // // Create and display a connection for testing
    // Connection myConnection = create_connection(1, "Connection Name", "Connection Description", 100, true, true, false, 1, 2, 3, 4, "TargetType", 5, 6, "TargetHierarchy", 7, false);
    // display_connection(myConnection);
    int num_connections;
    Connection *connections = fetch_connections(&num_connections);

    printf("Fetched %d connections.\n", num_connections);

    if (num_connections == 0) {
        printf("No connections found.\n");
    } else {
        printf("First connection:\n");
        display_connection(connections[0]);
    }

    // // Create and display a connection type for testing
    // ConnectionType myConnectionType = create_connection_type(1, 100, "ConnectionType Name", "Description", true, true, false, "TargetType", 5, 6, "TargetHierarchy", 7, false);
    // display_connection_type(myConnectionType);
    int num_connection_types;
    ConnectionType *connection_types = fetch_connection_types(&num_connection_types);

    printf("Fetched %d connection types.\n", num_connection_types);

    if (num_connection_types == 0) {
        printf("No connection types found.\n");
    } else {
        printf("First connection type:\n");
        display_connection_type(connection_types[0]);
    }

    // // Create and display a record type for testing
    // RecordType myRecordType = create_record_type(1, 100, "RecordType Name", "Description", true);
    // display_record_type(myRecordType);
    // Fetch record types from the database
    int num_record_types;
    RecordType *record_types = fetch_record_types(&num_record_types);

    printf("Fetched %d record types.\n", num_record_types);

    if (num_record_types == 0) {
        printf("No record types found.\n");
    } else {
        printf("First record type:\n");
        display_record_type(record_types[0]);
    }

    // Fetch records from the database
    printf("Fetching records...\n");

    int num_records;
    Record *records = fetch_records(&num_records);

    printf("Fetched %d records.\n", num_records);

    if (num_records == 0) {
        printf("No records found.\n");
    } else {
        printf("First record:\n");
        display_record(records[0]);
    }

    free(records); // Free the allocated memory

    printf("Done.\n");
    return 0;
}
