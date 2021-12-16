
//
//  main.c
//  day03
//
//  Created by Douglas Denney on 12/5/21.
//

#include <stdio.h>
#include <string.h>

int strbin2int(char* s) {
    char *p = s;
    int   r = 0;

    while (p && *p ) {
        r <<= 1;
        r += (unsigned int)((*p++) & 0x01);
    }
    return (int)r;
}

int countones (int* s, int t) {

    int m = 0;
    int c = 0;

    for (m=0; m<t; m++) {
        if (s[m] == 1) c++;
    }

    return c;
}

int main() {

    FILE *myFile;
    char input[1001][13];
    int i = 0;
    int x = 0;
    int one = 0;
    int zero = 0;
    int tot = 0;
    char s_one[2] = "1";
    char s_zero[2] = "0";
    char gamma[13];
    char epsilon[13];
    char o2[13];
    char co2[13];
    int bits;
    int useO2[1001];
    int useCO2[1001];
    int doneO2 = 0;
    int doneCO2 = 0;

    myFile = fopen("/Users/doug/GitHub/AdventOfCode/2021/day03/day03/input.txt", "r");
    if (myFile == NULL) {
        perror("Error");
        return 1;
    }

    while(fscanf(myFile, "%s", &input[i][0])!= EOF) i++;
    fclose(myFile);
    bits = (int)strlen(&input[0][0]);
    tot = i; //tot is the number of lines read

    gamma[0] = '\0';
    epsilon[0] = '\0';
    co2[0] = '\0';
    o2[0] = '\0';
    
    for (x=0; x<bits; x++) {
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
        
        if (zero == one) {
            strcat (&gamma[0], &s_one[0]);
            strcat (&epsilon[0], &s_zero[0]);
        }
        else if (zero > one) {
            strcat (&gamma[0], &s_zero[0]);
            strcat (&epsilon[0], &s_one[0]);
        }
        else {
            strcat (&gamma[0], &s_one[0]);
            strcat (&epsilon[0], &s_zero[0]);
        }
    }

    printf ("Gamma: Binary %s to decimal %d\n", gamma, strbin2int(gamma));
    printf ("Epsilon: Binary %s to decimal %d\n", epsilon, strbin2int(epsilon));
    printf ("Part 1: %d\n", strbin2int(gamma) * strbin2int(epsilon));
    
    for (i=0; i<tot; i++) {
        useO2[i] = 1;
        useCO2[i] = 1;
    }
    doneO2 = 0;
    doneCO2 = 0;

    for (x=0; x<bits; x++) {
        one = 0;
        zero = 0;
        for (i=0; i<tot; i++) {
            if (input[i][x] == '1' && useO2[i] == 1) {
                one++;
            }
            else if (useO2[i] == 1) {
                zero++;
            }
        }
                
        if (one == zero) {
            for (i=0; i<tot; i++) {
                if (!doneO2 && input[i][x] == '0' && useO2[i] == 1) {
                    useO2[i] = 0;
                    if (countones(useO2, tot) == 1) doneO2 = 1;
                }
            }
        }
        else if (one > zero) {
            for (i=0; i<tot; i++) {
                if (!doneO2 && input[i][x] == '0' && useO2[i] == 1) {
                    useO2[i] = 0;
                    if (countones(useO2, tot) == 1) doneO2 = 1;
                }
            }
        }
        else {
            for (i=0; i<tot; i++) {
                if (!doneO2 && input[i][x] == '1' && useO2[i] == 1) {
                    useO2[i] = 0;
                    if (countones(useO2, tot) == 1) doneO2 = 1;
                }
            }
        }
    }
    
    for (i=0; i<tot; i++) {
        if (useO2[i] == 1) {
            strcpy (o2, &input[i][0]);
        }
    }
    
    for (x=0; x<bits; x++) {
        one = 0;
        zero = 0;
        for (i=0; i<tot; i++) {
            if (input[i][x] == '1' && useCO2[i] == 1) {
                one++;
            }
            else if (useCO2[i] == 1) {
                zero++;
            }
        }
                
        if (one == zero) {
            for (i=0; i<tot; i++) {
                if (!doneCO2 && input[i][x] == '1' && useCO2[i] == 1) {
                    useCO2[i] = 0;
                    if (countones(useCO2, tot) == 1) doneCO2 = 1;
                }
            }
        }
        else if (one > zero) {
            for (i=0; i<tot; i++) {
                if (!doneCO2 && input[i][x] == '1' && useCO2[i] == 1) {
                    useCO2[i] = 0;
                    if (countones(useCO2, tot) == 1) doneCO2 = 1;
                }
            }
        }
        else {
            for (i=0; i<tot; i++) {
                if (!doneCO2 && input[i][x] == '0' && useCO2[i] == 1) {
                    useCO2[i] = 0;
                    if (countones(useCO2, tot) == 1) doneCO2 = 1;
                }
            }
        }
    }
    
    for (i=0; i<tot; i++) {
        if (useCO2[i] == 1) {
            strcpy (co2, &input[i][0]);
        }
    }
    printf("o2 binary=%s, decimal=%d\n", o2, strbin2int(o2));
    printf("co2 binary=%s, decimal=%d\n", co2, strbin2int(co2));
    printf("Part 2: %d\n", strbin2int(o2)*strbin2int(co2));
}
