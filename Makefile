CC=gcc
CFLAGS=-Wall -lgmp -Ofast -s -w

all: lprime

test-build: lprime.c
	$(CC) $(CFLAGS) lprime.c -o build-output/lprime

lprime: lprime.c
	$(CC) $(CFLAGS) lprime.c -o lprime

clean:
	rm -f lprime
