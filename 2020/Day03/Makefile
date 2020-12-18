CC=gcc
CFLAGS=-I.
OBJ = day03.o

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

day03: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)
