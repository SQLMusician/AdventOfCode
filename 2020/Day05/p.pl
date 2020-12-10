#!/usr/bin/env perl

use warnings;
use strict;

my $rowsub;
my @rowA;
my @rowB;
my $rowbinary;
my $row;
my $colsub;
my @colA;
my @colB;
my $colbinary;
my $col;
my $seatID;
my $highest = 0;
my @seatList;
my @mapSeatList;

open(FILE, "<", "data.txt") or die "Could not open data.txt\n";

while(<FILE>) {
  $seatID = 0;
  chomp;
  my $rowsub = substr($_, 0, 7);
  my @rowA = split ('', $rowsub);
  for (my $i = 0; $i < 7; $i++) {
    if ($rowA[$i] eq "F") {
      $rowB[$i] = "0";
    }
    else {
      $rowB[$i] = "1";
    }
  }
  $rowbinary = $rowB[0] . $rowB[1] . $rowB[2] . $rowB[3] . $rowB[4] . $rowB[5] . $rowB[6];
  $row = oct("0b" . $rowbinary);
  
  
  my $colsub = substr($_, 7, 3);
  my @colA = split ('', $colsub);
  for (my $i = 0; $i < 3; $i++) {
    if ($colA[$i] eq "L") {
      $colB[$i] = "0";
    }
    else {
      $colB[$i] = "1";
    }
  }
  $colbinary = $colB[0] . $colB[1] . $colB[2];
  $col = oct("0b" . $colbinary);
  
  $seatID = ($row * 8) + $col;
  push @seatList, int($seatID);
  
  if ($highest < $seatID) {
    $highest = $seatID;
  }
}
close(FILE);

@seatList = sort { $a <=> $b} @seatList;

@mapSeatList = map $seatList[$_-1]+1..$seatList[$_]-1, 1..@seatList-1;

print "Part 1: The answer to the problem is the highest seatID which is $highest\n";
print "Part 2: My Seat ID = " , join(" ", @mapSeatList), $/;
