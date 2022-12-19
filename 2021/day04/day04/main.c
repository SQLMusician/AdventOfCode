//
//  main.c
//  day04
//
//  Created by Douglas Denney on 12/7/21.
//

#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <unistd.h>

typedef struct rawFile {
    unsigned int sizeBytes;
    char *rawData;
} rawFile;

int main(void) {
    rawFile *myFile;
    int file;
    int filesize;
    int i, num;
    int linelen = 0;
    char *ptr;
    char filename[] = "/Users/doug/GitHub/AdventOfCode/2021/day04/input.txt";
    
    myFile = malloc(sizeof(rawFile));

    if ((file = open(filename, O_RDWR, 0666)) == -1) {
        fprintf(stderr, "Failed to open(2) '%s' %s\n", filename,
                strerror(errno));
        exit(EXIT_FAILURE);
    }
    
    if ((filesize = (int)lseek(file, 0, SEEK_END)) == -1) {
        fprintf(stderr, "Failed to lseek(2) %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }
    
    myFile->rawData = malloc(sizeof(char) * filesize + 1);
    myFile->sizeBytes = filesize;

    if (lseek(file, 0, SEEK_SET) == -1) {
        fprintf(stderr, "Failed to lseek(2) %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }
    
    if (read(file, myFile->rawData, myFile->sizeBytes) != myFile->sizeBytes) {
        fprintf(stderr, "Failed to read(2) %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }

    myFile->rawData[myFile->sizeBytes] = '\0';

    close(file);
    
    printf("Size of file: %d\n", myFile->sizeBytes);
    for (i=0; i< myFile->sizeBytes; i++) {
        printf ("%c", myFile->rawData[i]);
    }
    
    for (ptr = myFile->rawData; *ptr != '\n'; ptr++, linelen++);
    for (ptr = myFile->rawData, i = 0; *ptr != '\n'; ptr++, i++) {
        num = 0;
        while (*ptr != ',' && *ptr != '\n')
            num = num * 10 + (*(ptr++) - 48);
        printf ("Bingo# %d\n", num);
    }
    
    printf ("linelen=%d\n", linelen);
    return 0;
}
