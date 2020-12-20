#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int numlines (char *filename, int *filesize, int *maxlinesize) {
  FILE *fp; 
  int numline = 0;
  int charperline = 0;
  int maxcharinline = 0;
  char c;
  fp = fopen(filename, "r"); 
  if (fp == NULL) { 
    return 0; 
  }
  for (c = getc(fp); c != EOF; c = getc(fp)) {
    if (c == '\n') {
      numline++;
      if (charperline >= maxcharinline) {
        maxcharinline = charperline;
        charperline = 0;
      }
    }
    else {
      charperline++;
    }
  }
  fclose(fp); 
  *filesize = numline;
  *maxlinesize = maxcharinline;
  return numline;
}

int main() {

  FILE *myFile;
  int i = 0;
  int count = 0;
  int maxlines = 0;
  int maxchar = 0;
  char tmpstr[50];

  count = numlines ("data.txt", &maxlines, &maxchar);
  if (count == 0) {
    printf ("The file could not be opened. No line count reported.\n");
    exit(1);
  }

char *data = (char *)malloc(maxlines * maxchar * sizeof(char)); 

  myFile = fopen("data.txt", "r");

  while (fgets(*data[i], 50, myFile)) {
    *data[i][strlen(*data[i]) - 1] = '\0';
    i++;
  }
  fclose(myFile);

  for (i=0; i < tot; i++) {
    printf ("Line %d: %s\n", i, *data[i]);
  }
}