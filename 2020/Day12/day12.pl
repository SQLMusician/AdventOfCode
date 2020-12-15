#!/usr/bin/env perl

use warnings;
use strict;

my @data = ();
my $xtmp = 0;
my $ytmp = 0;
my $x = 0;
my $waypointx = 10;
my $shipx = 0;
my $y = 0;
my $waypointy = 1;
my $shipy = 0;
my $facing = "E";
my $magnitude;
my $action;
my $degree = 0;
my $spin = 0;
my $value;
my $item;
my @compass = ("N", "E", "S", "W");

open(DATA, "data.txt") or die "Could not open data.txt: $!\n";
@data = <DATA>;
close (DATA);
chomp @data;

foreach $item (@data) {
  $action = substr ($item, 0, 1);
  $value = substr ($item, 1);

  if (($action eq "L") or ($action eq "R")) {
    SWITCH: {
      if ($facing eq "N") { $degree = 0; last SWITCH; }
      if ($facing eq "E") { $degree = 90; last SWITCH; }
      if ($facing eq "S") { $degree = 180; last SWITCH; }
      if ($facing eq "W") { $degree = 270; last SWITCH; }
    }
    $spin = $degree + $value;
    if ($spin >= 360) {$spin -= 360};

    SWITCH: {
      if ($facing eq "N") {last SWITCH;};
      if ($facing eq "E") {last SWITCH;};
      if ($facing eq "S") {last SWITCH;};
      if ($facing eq "W") {last SWITCH;};
    }
    if ($spin == 0) {};
    if ($spin == 90) {};
    if ($spin == 180) {};
    if ($spin == 270) {};

    if ($action eq "R") {
      $facing = $compass[(($degree + $value) / 90) % 4];
    }
    elsif ($action eq "L") {
      $facing = $compass[(($degree + (360 - $value)) / 90) % 4];
    }


  }
  else {
    if ($action eq "F") {
      $action = $facing;
      $shipx = $shipx + ($waypointx * $value);
      $shipy = $shipy + ($waypointy * $value);
    }
  }

  SWITCH: {
    if ($action eq "N") { $y += $value; $waypointy += $value; last SWITCH; }
    if ($action eq "S") { $y -= $value; $waypointy -= $value; last SWITCH; }
    if ($action eq "E") { $x += $value; $waypointx += $value; last SWITCH; }
    if ($action eq "W") { $x -= $value; $waypointx -= $value; last SWITCH; }
  }
}

print "Part 1: ", abs($x) + abs($y), "\n";
print "Part 2: ", abs($shipx) + abs($shipy), "\n";
