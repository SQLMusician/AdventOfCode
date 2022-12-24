//
//  main.c
//  day01
//
//  Created by Douglas Denney on 19-DEC-2022
//

/*

answer for part 1: 74394
answer for part 2: 212836

top 3 high values
68579
69863
74394


Part 1: Highest Value = 74394
Part 2: Top 3 are, 74394, 69863, 68391
Part 2: Top 3 values = 212648
*/

#include <stdio.h>
#include <string.h>

#define BUFSZ 4096

int main (int argc, char **argv) {

    size_t n = 1;
    char buf[BUFSZ] = "";
    FILE *fp;
    int curtot = 0;
    int h1 = 0;
    int h2 = 0;
    int h3 = 0;
    int t = 0;

    if (argc > 1) {
      fp = fopen (argv[1], "r");
    }
    else {
       fprintf (stderr, "usage: %s <input file>\n", argv[0]);
    }

    if (!fp) {  /* validate file open for reading */
        fprintf (stderr, "error: file open failed '%s'.\n", argv[1]);
        return 1;
    }

    while (fgets (buf, BUFSZ, fp)) {        /* read each line in file */
        size_t len = strlen (buf);          /* get buf length */
        if (len && buf[len-1] == '\n')      /* check last char is '\n' */
            buf[--len] = 0;                 /* overwrite with nul-character */
        else {   /* line too long or non-POSIX file end, handle as required */
            printf ("line[%2zu] : %s\n", n, buf);
            continue;
        }

        if (len) {
          sscanf(buf, "%d", &t);
          curtot = curtot + t;
        }
        else {
          t = curtot;
          if (curtot > h1) {
            h1 = curtot;
          }
          else if (curtot > h2) {
            h2 = curtot;
          }
          else if (curtot > h3) {
            h3 = curtot;
          }
          curtot = 0;
        }
        printf ("line[%2zu] %d : %s\n", n++, t, len ? buf : "empty");
        //printf ("%d : %s\n", t, len ? buf : "empty");
    }
    if (fp != stdin) fclose (fp);           /* close file if not stdin */

    printf ("Part 1: Highest Value = %d\n", h1);
    printf ("Part 2: Top 3 are, %d, %d, %d\n", h1, h2, h3);
    printf ("Part 2: Top 3 values = %d\n", h1 + h2 + h3);
    return 0;
}
