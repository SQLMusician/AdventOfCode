FILENAME = day02
CC=gcc
CFLAGS=-I.
OBJ = $(FILENAME).o

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

$(FILENAME): $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
