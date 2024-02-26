#ifndef DOT_H
#define DOT_H

#include "common.h"

typedef struct Dot {
    int id;
    int userId;
    int projectId;
    int recordId;
    int duration;
    char description[1024];
} Dot;

// Function declarations
Dot create_dot(int id, int userId, int projectId, int recordId, int duration);
void display_dot(Dot dot);
Dot* fetch_dots(int *num_dots);

#endif // DOT_H
