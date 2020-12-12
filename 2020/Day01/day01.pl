#!/usr/bin/env perl

use warnings;

#
# This line is needed to avoid getting warnings about the use of the ~~ smartmatch.
#
use experimental 'smartmatch';
use strict;
use Data::Dumper;

my @data1 = ();
my @data2 = ();
my @data3 = ();
my $item1 = 0;
my $item2 = 0;
my $mult = 0;

open(DATA, "data.txt") or die "Could not open data.txt: $!\n";
@data1 = <DATA>;
close (DATA);

chomp @data1;
@data2 = @data1;
@data3 = @data1;

foreach $item1 (@data1) {
  if ((2020 - $item1) ~~ @data2) {
    $mult = (2020 - $item1) * $item1;
    last;
  }
}

print "Part 1: $mult\n";

foreach $item1 (@data1) {
  foreach $item2 (@data2) {
    if ((2020 - $item1 - $item2) ~~ @data3) {
      $mult = $item1 * $item2 * (2020 - $item1 - $item2);
      last;
    }
  }
}

print "Part 2: $mult\n";
