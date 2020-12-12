#!/usr/bin/env perl

use warnings;
use strict;

my @data = ();
my $total = 0;

open(DATA, "data.txt") or die "Could not open data.txt: $!\n";
@data = <DATA>;
close (DATA);
chomp @data;

foreach my $item (@data) {
  (my $r, my $s, my $p) = split(' ', $item);

  $r =~ s/-/,/; 
  $s =~ s/://;
  my $z = "$s\{$r\}\$";
  my @range = split (',', $r);

  my $count = () = $p =~ /$s/g;
  my $low = $range[0];
  my $high = $range[1];

  if ($count >= $low) {
    if ($count <= $high) {
      $total++;
    }
  }
}

print "Part 1: $total\n";
$total = 0;

foreach my $item (@data) {
  (my $r, my $s, my $p) = split(' ', $item);

  $r =~ s/-/,/; 
  $s =~ s/://;
  my @range = split (',', $r);

  my $count = () = $p =~ /$s/g;
  my $low = $range[0];
  my $high = $range[1];
  my $charlow = substr($p, $low-1, 1);
  my $charhigh = substr($p, $high-1, 1);

  if ("$charlow" eq "$s") {
    if ("$charhigh" ne "$s") {
      $total++;
    }
  }
  else {
    if ("$charhigh" eq "$s") {
      $total++;
    }
  }
}

print "Part 2: $total\n";
