#!/usr/bin/env perl

use warnings;
use strict;
use feature qw(switch);

sub north {
  return "N";
}

sub south {
  return "S";
}

sub east {
  return "E";
}

sub west {
  return "W";
}

sub direction {
  my $d = @_;


}
my @data = ();
my $x = 0;
my $y = 0;
my $facing = "E";
my $degree = "90";
my $action;
my $value;
my $item;

open(DATA, "data.txt") or die "Could not open data.txt: $!\n";
@data = <DATA>;
close (DATA);

chomp @data;

foreach $item (@data) {
  $action = substr ($item, 0, 1);
  $value = substr ($item, 1);

  if (($action eq "L") or ($action eq "R")) {
    $facing = direction($action, $facing);
  }
  elsif ($action eq "F") {

  }
  else {

  }
  given($action) {
    when("N") { $y += $value; print "\$y = $y\n";}
    when("S") { $y -= $value; print "\$y = $y\n";}
    when("E") { $x += $value; print "\$x = $x\n";}
    when("W") { $x -= $value; print "\$x = $x\n";}
    when("F") { print "Forward $value\n"; }
  }
}
