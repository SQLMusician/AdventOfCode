#!/usr/bin/perl

use warnings;
use strict;

#
# 17-19 f: cnffsfffzhfnsffttms
# f{17,19}
my $string = "ffffff";
my $count = () = $string =~ /f/g;
my $low = 1;
my $high = 4;

if ($count < ($high - $low + 1)) {
  print "Password Count okay\n";
}
else {
  print "Password Count failed\n";
}

if ($string =~ /f{1,4}/) {
  print "password okay, $count\n";
}
else {
  print "password failed, $count\n";
};


