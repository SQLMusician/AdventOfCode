#!/usr/bin/bash

perl -00ne 's|\s+$||; s# [\r\n]+ # #xg; s/_cid://; print $_, "\n";' data.txt > data2.txt
