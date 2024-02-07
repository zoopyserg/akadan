# Makefile

CC=gcc
CFLAGS=-I. -I/usr/include/postgresql
LDFLAGS=-lpq
DEPS = record.h connection.h connection_type.h record_type.h common.h
OBJ = program.o record.o connection.o connection_type.o record_type.o common.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

program: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LDFLAGS)
