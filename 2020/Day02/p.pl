#!/usr/bin/perl

#
# answer is 528
#
use warnings;
use strict;

my $r = "a";
my $s = "a";
my $p = "a";
my $z = "a";

open(FILE, "data.txt") or die "Could not open data.txt\n";

while(<FILE>) {
  chomp;
  ($r, $s, $p) = split(' ', $_);

  $r =~ s/-/,/; 
  $s =~ s/://;
  $z = "$s\{$r\}\$";
  my @range = split (',', $r);

  my $count = () = $p =~ /$s/g;
  my $low = $range[0];
  my $high = $range[1];

if ($count >= $low) {
  if ($count <= $high) {
    print "Password Okay\n";
  }
  else {
    print "Password Failed\n";
  }
} else {
  print "Password Failed\n";
}

#  if ($p =~ /$z/) {
#    print "Password Okay, $z, $p, $r, $s, count=$count\n";
#  }
#  else {
#    print "Password Failed, $z, $p, $r, $s, count=$count\n";
#  }

}
close FILE;
