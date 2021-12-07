#include <stdio.h>
#include <string.h>

int strbin2i(char* s) {
  char *p = s;
  int   r = 0;

  while (p && *p ) {
    r <<= 1;
    r += (unsigned int)((*p++) & 0x01);
  }

  return (int)r;
}

int main() {

  FILE *myFile;

  //read file into array
  char input[1001][13];
  int i = 0;
  int x = 0;
  int one = 0;
  int zero = 0;
  int debug = 1;
  int tot = 0;
  char s_one[2] = "1";
  char s_zero[2] = "0";
  char gamma[13];
  char epsilon[13];

  myFile = fopen("input.txt", "r");
  while(fscanf(myFile, "%s", &input[i][0])!= EOF) {
    if (debug) printf("%d. %s [%c]\n", i, input[i], input[i][0]);
    i++;
  }
  fclose(myFile);

  tot = i; //tot is the number of lines read
  for (x=0; x<12; x++) {
    one = 0;
    zero = 0;
    for (i=0; i<tot; i++) {
      if (input[i][x] == '0') {
        zero++;
      }
      else {
        one++;
      }
    }
    if (zero > one) {
      strcat (&gamma[0], &s_zero[0]);
      strcat (&epsilon[0], &s_one[0]);
    }
    else {
      strcat (&gamma[0], &s_one[0]);
      strcat (&epsilon[0], &s_zero[0]);
    }
    if (debug) printf ("gamma=%s; epsilon=%s\n", gamma, epsilon);
  }

  printf ("Gamma:   Bin %s to decimal %d\n", gamma, strbin2i(gamma));
  printf ("Epsilon: Bin %s to decimal %d\n", epsilon, strbin2i(epsilon));
  printf ("Part 1: %d\n", strbin2i(gamma) * strbin2i(epsilon));
}
