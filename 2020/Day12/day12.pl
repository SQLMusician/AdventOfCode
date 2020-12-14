#!/usr/bin/env perl

use warnings;
use strict;
use feature qw(switch);

sub newdirection {
   # get total number of arguments passed.
   my $fac = @_[0];
   my $act = @_[1];
   my $val = @_[2];
   
   given($fac) {
    when("N") { $y += $value; print "\$y = $y\n";}
    when("S") { $y -= $value; print "\$y = $y\n";}
    when("E") { $x += $value; print "\$x = $x\n";}
    when("W") { $x -= $value; print "\$x = $x\n";}
   }
   foreach $item (@_) {
      $sum += $item;
   }
   $average = $sum / $n;

   return $average;
}

my @data = ();
my $x = 0;
my $y = 0;
my $facing = "E";
my $facingvalue = "90";
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

  given($action) {
    when("N") { $y += $value; print "\$y = $y\n";}
    when("S") { $y -= $value; print "\$y = $y\n";}
    when("E") { $x += $value; print "\$x = $x\n";}
    when("W") { $x -= $value; print "\$x = $x\n";}
    when("L") { $facing = newdirection($facing, $action, $value);}
    when("R") { print "Right $value\n"; }
    when("F") { print "Forward $value\n"; }
    default { print "Something Else $value\n" }
  }
}
