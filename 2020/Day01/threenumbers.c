#include <stdio.h>

void main() {

    FILE *myFile;
    myFile = fopen("data.txt", "r");

    //read file into array
    int ArrayA[201];
    int ArrayB[201];
    int ArrayC[201];
    int i, x, y;
    int sum;

    for (i = 0; i < 200; i++)
    {
        fscanf(myFile, "%d", &ArrayA[i]);
        ArrayB[i] = ArrayA[i]; 
        ArrayC[i] = ArrayA[i]; 
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
        for (y=0; y<200; y++) {
          sum = ArrayA[i] + ArrayB[x] + ArrayC[y];
          if (sum == 2020) {
            printf("These values: %d + %d + %d = %d and multiplied = %d\n", 
            ArrayA[i], ArrayB[x], ArrayC[y], ArrayA[i] + ArrayB[x] + ArrayC[y], ArrayA[i] * ArrayB[x] * ArrayC[y]);
        }
      }
      }
    }
}
