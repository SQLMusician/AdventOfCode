//
//  main.c
//  day02
//
//  Created by Douglas Denney on 12/5/21.
//

#include <stdio.h>

int main() {

    FILE *myFile;
    char inst[10];
    int value;
    int hp = 0;
    int depth = 0;
    int P2hp = 0;
    int P2depth = 0;
    int i = 0;
    int aim = 0;
    int debug = 0;

    myFile = fopen("/Users/doug/GitHub/AdventOfCode/2021/day02/day02/input.txt", "r");
    if (myFile == NULL) {
        perror("Error");
        return 1;
    }
    
    while(fscanf(myFile, "%s %d", &inst[0], &value)!= EOF) {
      switch( inst[0] )
      {
        case 'f':
          hp=hp+value;
          P2hp=P2hp+value;
          P2depth=P2depth+(aim*value);
          if (debug) printf("%d. %s;%d;hp=%d;depth=%d;P2hp=%d;P2depth=%d\n", i, inst, value, hp, depth, P2hp, P2depth);
          break;
        case 'u':
          depth=depth-value;
          aim=aim-value;
          if (debug) printf("%d. %s;%d;hp=%d;depth=%d;P2hp=%d;P2depth=%d\n", i, inst, value, hp, depth, P2hp, P2depth);
          break;
        case 'd':
          depth=depth+value;
          aim=aim+value;
          if (debug) printf("%d. %s;%d;hp=%d;depth=%d;P2hp=%d;P2depth=%d\n", i, inst, value, hp, depth, P2hp, P2depth);
          break;
      }
      i++;
    }

    fclose(myFile);

    printf ("Part 1: horizontal position: %d; depth: %d; p*d=%d\n", hp, depth, hp*depth);
    printf ("Part 2: horizontal position: %d; depth: %d; p*d=%d\n", P2hp, P2depth, P2hp*P2depth);
}
