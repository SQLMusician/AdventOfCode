CC=gcc
CFLAGS=-I.
OBJ = day01.o

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

day01: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
