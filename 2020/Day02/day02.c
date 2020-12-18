#include <stdio.h>
#include <regex.h>

int main() {

  int data
    FILE *myFile;
    myFile = fopen("data.txt", "r");

    //read file into array
    int data[1000];

    for (i = 0; i < 200; i++)
    {
        fscanf(myFile, "%d", &ArrayA[i]);
        ArrayB[i] = ArrayA[i]; 
        ArrayC[i] = ArrayA[i];
    }

    fclose(myFile);

    for (i=0; i<200; i++) {
      for (x=0; x<200; x++) {
        sum = ArrayA[i] + ArrayB[x];
        if (sum == 2020) {
          mult = ArrayA[i] * ArrayB[x];
          break;
        }
      }
    }

    printf ("Part 1: %d\n", mult);
     
    for (i=0; i<200; i++) {
      for (x=0; x<200; x++) {
        for (y=0; y<200; y++) {
          sum = ArrayA[i] + ArrayB[x] + ArrayC[y];
          if (sum == 2020) {
            mult = ArrayA[i] * ArrayB[x] * ArrayC[y];
            break;
          }
        }
      }
    }

    printf ("Part 2: %d\n", mult);
}
