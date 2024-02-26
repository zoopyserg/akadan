#include "dot.h"

// Function to create a record
Dot create_dot(int id, int userId, int projectId, int recordId, int duration) {
    Dot newDot;
    newDot.id = id;
    newDot.userId = userId;
    newDot.projectId = projectId;
    newDot.recordId = recordId;
    newDot.duration = duration;
    // Initialize other fields as needed
    return newDot;
}

// Function to display a record (for demonstration/testing)
void display_dot(Dot dot) {
    printf("Dot ID: %d\n", dot.id);
    printf("User ID: %d\n", dot.userId);
    printf("Project ID: %d\n", dot.projectId);
    printf("Record ID: %d\n", dot.recordId);
    printf("Duration: %d\n", dot.duration);
    printf("Description: %s\n", dot.description);
    // Display other fields as needed
}

// Adjusted fetch_records to include the name in the SELECT query
Dot* fetch_dots(int *num_dots) {
    const char *connection = "dbname=journal_development user=diamondserge password=112223 host=localhost";
    PGconn *conn = PQconnectdb(connection);

    if (PQstatus(conn) == CONNECTION_BAD) {
        fprintf(stderr, "Connection to database failed: %s\n", PQerrorMessage(conn));
        PQfinish(conn);
        exit(1);
    }

    // Include 'name' in the SELECT
    PGresult *res = PQexec(conn, "SELECT id, user_id, record_id, project_id, duration, description FROM dots");

    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "SELECT failed: %s\n", PQerrorMessage(conn));
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    int nrows = PQntuples(res);
    Dot *dots = malloc(nrows * sizeof(Dot)); // Assuming you'll not exceed initial capacity for simplicity
    if (!dots) {
        // handle memory allocation error
        PQclear(res);
        PQfinish(conn);
        exit(1);
    }

    *num_dots = nrows;
    for (int i = 0; i < nrows; i++) {
        dots[i].id = atoi(PQgetvalue(res, i, 0));
        dots[i].userId = atoi(PQgetvalue(res, i, 1));
        dots[i].recordId = atoi(PQgetvalue(res, i, 2));
        dots[i].projectId = atoi(PQgetvalue(res, i, 3));
        dots[i].duration = atoi(PQgetvalue(res, i, 4));

        strncpy(dots[i].description, PQgetvalue(res, i, 5), sizeof(dots[i].description) - 1);
        dots[i].description[sizeof(dots[i].description) - 1] = '\0'; // Ensure null termination
    }

    PQclear(res);
    PQfinish(conn);

    return dots;
}
