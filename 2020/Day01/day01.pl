#!/usr/bin/env perl

use warnings;
use strict;

my @data1 = ();
my @data2 = ();
my @data3 = ();
my $item1 = 0;
my $item2 = 0;
my $item3 = 0;
my $mult = 0;
my $done = 0;

open(DATA, "data.txt") or die "Could not open data.txt: $!\n";
@data1 = <DATA>;
close (DATA);
chomp @data1;

@data2 = @data1;
@data3 = @data1;

foreach $item1 (@data1) {
  foreach $item2 (@data2) {
    if ((2020 - $item1) == $item2) {
      $mult = $item1 * $item2;
      $done = 1;
      last;
    }
  }
  if ($done) {last;}
}
print "Part 1: $mult\n";

$done = 0;

foreach $item1 (@data1) {
  foreach $item2 (@data2) {
    foreach $item3 (@data3) {
      if ((2020 - $item1 - $item2) == $item3) {
        $mult = $item1 * $item2 * $item3;
        $done = 1;
        last;
      }
    }
    if ($done) {last;}
  }
  if ($done) {last;}
}
print "Part 2: $mult\n";
