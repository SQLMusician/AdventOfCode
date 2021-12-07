CC=gcc
CFLAGS=-I.
OBJ = day04.o

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

day04: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
