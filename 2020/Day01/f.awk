#!/bin/bash

#awk '{ awkArray[counter++] = $1; } END { for (n=0; n<counter;n++)
# print awkArray[n],"\n"; }' bird.txt

# awk 'BEGIN { for(i=1;i<=6;i++) print "square of", i, "is",i*i; }'

awk '{awkArray[counter++] = $1; } END { for (n=0; n<counter;n++) print awkArray[n], "\n"; }' data.txt
