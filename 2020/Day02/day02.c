#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main() {

  FILE *myFile;
  int i = 0, tot = 0;
  int x = 0;
  int low = 0;
  int high = 0;
  int count = 0;
  int totala = 0;
  int totalb = 0;
  char *ctomatch;
  char *matchstring;
  char tmpstr[50];
  char data[1000][50];

  myFile = fopen("data.txt", "r");

  while (fgets(data[i], 50, myFile)) {
    data[i][strlen(data[i]) - 1] = '\0';
    i++;
  }
  tot = i;

  fclose(myFile);

  for (i=0; i < tot; i++) {
    strcpy (tmpstr, data[i]);
    low = (int) strtol (strtok (tmpstr, " -"), NULL, 10);
    high = (int) strtol (strtok (NULL, " "), NULL, 10);
    ctomatch = strtok (NULL, " :");
    matchstring = strtok (NULL, " ");

    count = 0;
    for (x=0; x<strlen(matchstring); x++) {
      if (ctomatch[0] == matchstring[x]) count++;
    }

    if (count >= low && count <= high) totala++;

    if (ctomatch[0] == matchstring[low-1]) {
      if (ctomatch[0] != matchstring[high-1]) {
        totalb++;
      }
    }
    else {
      if (ctomatch[0] == matchstring[high-1]) {
        totalb++;
      }
    }
  }
  printf ("Part 1: %d\n", totala);
  printf ("Part 2: %d\n", totalb);
}