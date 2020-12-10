#!/usr/bin/env perl

use strict;
use warnings;

open my $in, '<', 'data3.txt' or die $!;
my @lines = <$in>;
close $in;
chomp @lines;

my $linecount = @lines;
my $currcount = 0;
my $total = 0;
my $count = 0;
my $char = ":";
while ($currcount < $linecount) {
  $count = 0;
  ++$count while $lines[$currcount] =~ /\Q$char/g;
  if ($count == 7) {
    $total++;
    print "$lines[$currcount]\n";
  }
  $currcount++;
}
print "Total correct passports: $total\n";