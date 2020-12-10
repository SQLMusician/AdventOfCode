#!/usr/bin/perl

#
# answer was 497
#

use warnings;
use strict;

open(FILE, "data.txt") or die "Could not open data.txt\n";

while(<FILE>) {
  chomp;
  (my $r, my $s, my $p) = split(' ', $_);

  $r =~ s/-/,/; 
  $s =~ s/://;
  my @range = split (',', $r);

  my $count = () = $p =~ /$s/g;
  my $low = $range[0];
  my $high = $range[1];
  my $charlow = substr($p, $low-1, 1);
  my $charhigh = substr($p, $high-1, 1);

  if ("$charlow" eq "$s") {
    if ("$charhigh" eq "$s") {
      print "Password Failed";
    }
    else {
      print "Password Okay";
    }
  }
  else {
    if ("$charhigh" eq "$s") {
      print "Password Okay";
    }
    else {
      print "Password Failed";
    }
  }
  print " ==> $p, {$r}, $s, low=$low, high=$high, charlow=$charlow, charhigh=$charhigh\n";
}
close FILE;
