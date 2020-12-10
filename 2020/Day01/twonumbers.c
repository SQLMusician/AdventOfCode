#include <stdio.h>

void main() {

    FILE *myFile;
    myFile = fopen("data.txt", "r");

    //read file into array
    int ArrayA[201];
    int ArrayB[201];
    int i, x;
    int sum;

    for (i = 0; i < 200; i++)
    {
        fscanf(myFile, "%d", &ArrayA[i]);
        ArrayB[i] = ArrayA[i]; 
    }

    fclose(myFile);

/*
    for (i = 0; i < 200; i++)
    {
        printf("A[%d]=%d; B[%d]=%d\n", i, ArrayA[i], i, ArrayB[i]);
    }
*/

    for (i=0; i<200; i++) {
      for (x=0; x<200; x++) {
        sum = ArrayA[i] + ArrayB[x];
/*        printf ("%d + %d = %d\n", ArrayA[i], ArrayB[x], ArrayA[i] + ArrayB[x]);*/
        if (sum == 2020) {
          printf("These values: %d, %d = %d and mulplied = %d\n", 
            ArrayA[i], ArrayB[x], ArrayA[i] + ArrayB[x], ArrayA[i] * ArrayB[x]);
        }
      }
    }
}
