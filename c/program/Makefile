CC=gcc
CFLAGS=-I. -I/usr/include/postgresql
LDFLAGS=-lpq
DEPS = $(wildcard *.h)
SRC = $(filter-out all_solved_tree_record_ids.c program.c, $(wildcard *.c))
OBJ = $(SRC:.c=.o)
ALL_SOLVED_OBJ = all_solved_tree_record_ids.o $(OBJ)
PROGRAM_OBJ = program.o $(OBJ)
TARGETS = all_solved_tree_record_ids program

# Rule for compiling all targets
all: $(TARGETS)

# Rule for compiling the all_solved_tree_record_ids binary
all_solved_tree_record_ids: $(ALL_SOLVED_OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

# Rule for compiling the main program binary
program: $(PROGRAM_OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)

# Generic rule for object files
%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(TARGETS) *.o

