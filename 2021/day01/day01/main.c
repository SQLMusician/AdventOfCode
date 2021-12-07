//
//  main.c
//  day01
//
//  Created by Douglas Denney on 12/5/21.
//

#include <stdio.h>

int main() {

    FILE *myFile;
    int A[2001];
    int B[2001];
    int increase = 0;
    int i, tot;
    int debug = 0;
    i = 0;
    tot = 0;
    
    myFile = fopen("/Users/doug/GitHub/AdventOfCode/2021/day01/day01/input.txt", "r");
    if (myFile == NULL) {
        perror("Error");
        return 1;
    }
    while(fscanf(myFile, "%d", &A[i])!= EOF) {
      i++;
    }
    tot = i;

    fclose(myFile);

    for (i=0; i<tot; i++) {
      if (A[i+1] > A[i]) {
        increase++;
      }
    }

    printf ("Part 1: %d\n", increase);

    increase = 0;

    for (i=0; i<tot-2; i++) {
      B[i] = A[i] + A[i+1] + A[i+2];
    }

    for (i=0; i<tot-2; i++) {
      if (B[i+1] > B[i]) {
        increase++;
        if (debug) {
          printf ("*** B[%d]=%d (A[%d]=%d; A[%d]=%d; A[%d]=%d); sum=%d\n", i, B[i], i, A[i], i+1, A[i+1], i+2, A[i+2], A[i]+A[i+1]+A[i+2]);
        }
      }
    }
     
    printf ("Part 2: %d\n", increase);
}
