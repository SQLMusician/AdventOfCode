#include <stdio.h>
#include <string.h>
#include <stdlib.h>

FILE *myFile;
int i = 0, x = 0;
int row, col, srow, scol;
unsigned long int m0, m1, m2, m3, m4;
int maxlines = 0;
int maxchar = 0;
int trees = 0;
unsigned long int part2total;
char buffer[50];
char data[500][2500];

int counttrees () {
  while (row <= maxlines) {
  if (strlen(data[row]) > 0) {
    if (data[row][col] == '#') {
      trees++;
    }
  }
  row += srow;
  col += scol;
  }
  return trees;
}

int main() {

  myFile = fopen("data.txt", "r");

  while (fgets(buffer, 40, myFile)) {
    buffer[strcspn(buffer, "\r\n")] = 0;
    if (maxchar == 0) maxchar = strlen(buffer);
    for (x=0; x<45; x++) {
      strncat(data[i], buffer, maxchar);
    }
    i++;
  }
  fclose(myFile);

  maxlines = i;

/*
Right 1, down 1.
Right 3, down 1. (This is the slope you already checked.)
Right 5, down 1.
Right 7, down 1.
Right 1, down 2.
*/

  row = 0; col = 0; srow = 1; scol = 3; trees = 0; m0 = counttrees();
  printf ("Part 1: %ld\n", m0);
  row = 0; col = 0; srow = 1; scol = 1; trees = 0; m1 = counttrees();
  row = 0; col = 0; srow = 1; scol = 5; trees = 0; m2 = counttrees();
  row = 0; col = 0; srow = 1; scol = 7; trees = 0; m3 = counttrees();
  row = 0; col = 0; srow = 2; scol = 1; trees = 0; m4 = counttrees();

  printf ("m0 = %ld\n", m0);
  printf ("m1 = %ld\n", m1);
  printf ("m2 = %ld\n", m2);
  printf ("m3 = %ld\n", m3);
  printf ("m4 = %ld\n", m4);

  part2total = m0 * m1 * m2 * m3 * m4;
  printf ("Part 2: %ld\n", part2total);
  printf ("Part 2 answer should be: 3584591857\n");
}

/*
m0 = 211
m1 = 67
m2 = 74
m3 = 82
m4 = 37

Part 1 211
1 1 67
3 1 211
5 1 77
7 1 89
1 2 37
Part 2 3584591857


*/