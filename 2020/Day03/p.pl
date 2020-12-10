#!/usr/bin/perl

use warnings;
use strict;

open(FILE, "data.txt") or die "Could not open data.txt\n";

my @lines = <FILE>;
close FILE;
chomp @lines;

my $count = @lines;

my $loop = 0;
my $i = 0;

while ($loop < $count) {
  for ($i=0; $i < 4; $i++) {
    $lines[$loop] = "$lines[$loop]$lines[$loop]";
  }
  $loop++;
}

$loop = 0;

while ($loop < $count) {
  my $l = length $lines[$loop];
  print "line $loop, length $l\n";
  $loop++;
}

my @chararray = split('', @lines);

print "@chararray\n";
print "$chararray[0]\n";
