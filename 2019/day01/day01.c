#include <stdio.h>

unsigned int calcfuel (int m) {

   int fuel = 0;

   if(m <= 6) {
      return 0;
   }

   fuel = (m / 3) - 2;
   return fuel + calcfuel (fuel);
}

int main() {

    FILE *myFile;
    myFile = fopen("input.txt", "r");

    //read file into array
    int f;
    int sum = 0;
    int P2sum = 0;
    int i = 0;
    int debug = 0;

    while(fscanf(myFile, "%d", &f)!= EOF) {
      sum = sum + ((f / 3) - 2);
      P2sum = P2sum + calcfuel (f); 
      i++;
    }

    fclose(myFile);

    printf ("Part 1: %d\n", sum);
    printf ("Part 2: %d\n", P2sum);
}
