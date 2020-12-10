#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include <ctype.h>

#define MAXLINE 500

// errmsg: print msg and exit
void errmsg(char *msg)
{
    fprintf(stderr, "%s\n", msg);
    exit(1);
}
    
int main(int argc, char **argv)
{
  char c;
  int count = 0;
  char buffer[MAXLINE];
  char filename[50];
  char message[100];
  FILE *fp;

  if (argc != 2) errmsg("usage: ./formck <input-file>");

  strcpy (filename, argv[1]);

  // Open the file 
  fp = fopen(filename, "r"); 
  
  // Check if file exists 
  if (fp == NULL) 
  { 
    strcpy (message, "Count not open file: ");
    strcat (message, filename);
    errmsg(message);
    return 0; 
  } 

  for (c = getc(fp); c != EOF; c = getc(fp)) if (c == '\n') count = count + 1; 
  
  // Close the file 
  fclose(fp); 

  printf ("number of lines in file = %d\n", count);
  return 0;
}
