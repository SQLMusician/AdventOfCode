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