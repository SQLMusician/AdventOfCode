#include <stdio.h>
#include <regex.h>

int main() {

  FILE *myFile;
  int i;
  char *data[1000][50];

  myFile = fopen("data.txt", "r");

  for (i = 0; i < 200; i++)
  {
    fgets(&data[i], 50, myFile);
  }

  fclose(myFile);

  for (i=0; i < 1000; i++) {
    printf ("Line %d: %s\n", i, data[i]);
  }
}
