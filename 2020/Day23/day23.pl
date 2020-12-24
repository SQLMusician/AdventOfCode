#!/usr/bin/env perl

use warnings;
use strict;

my @cups = ();
my @pickup = ();
my $index = 0;
my $currentcup;
my $destcup = 0;
my $destcupindex;
my $cupfound;
my $splicestart = 0;
my $i = 0;
my $x = 0;
my $score = 0;
my $debug = 1;
my $highval=0;

@cups = (8, 5, 3, 1, 9, 2, 6, 4, 7);

for ($i = 0; $i<100; $i++) {
  if ($debug) {print "Starting Round #", $i+1, "\n";}
  if ($debug) {print "Cups: ", join(',', @cups), "\n";}
  $currentcup = $cups[$index];
  $destcup = $currentcup - 1;
  if ($destcup < 1) {$destcup = 9;}
  $splicestart = $index + 1;
  if ($splicestart > @cups) {$splicestart = 0;}
  @pickup = splice(@cups, $splicestart, 3);

  if ($debug) {print "Current Cup: (index ", $index, "): ", $currentcup, "\n";}
  if ($debug) {print "Cups: ", join(',', @cups), "\n";}
  if ($debug) {print "Picked Up: ", join(',', @pickup), "\n";}
  if ($debug) {print "Dest Cup: ", $destcup, "\n";}

  $cupfound = 0;
  $x = 0;
  while ($destcup) {
    for ($x=0; $x<@cups; $x++) {
      print "==> destcup = ", $destcup, "; x = ", $x, "\n";
      if ($cups[$x] == $destcup) {
        $destcupindex = $x;
        $cupfound = 1;
        last;
      }
    }
    if (not $cupfound) {
      $x++;
      $destcup--;
    }
    else {last;}
  }

  if (not $cupfound) {
    for ($x=0; $x < @cups; $x++) {
      if ($cups[$x] > $highval) {$highval = $cups[$x]}
      $destcupindex = $x;
      last;
    }
  }

  if ($debug) {print "destcupindex = ", $destcupindex, "\n";}

  splice(@cups, $destcupindex+1, 0, @pickup);
  if ($debug) {print "Cups: ", join(',', @cups), "\n";}
  $index++;
  my $arrsize = @cups;
  if ($index > @cups - 1) {$index = 0;}
  if ($debug) {print "\n";}
}