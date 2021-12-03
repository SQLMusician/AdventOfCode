CC=gcc
CFLAGS=-I.
OBJ = day02.o

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

day02: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
