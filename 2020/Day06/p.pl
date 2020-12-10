#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;

my @originaldata = ();
my @data = ();
my $line;
my $originalline;
my $count = 0;
my $sum = 0;
my @chars = ();
my @filtered = ();

sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

sub fixline {
  my @fchars = split (//, $_[0]);
  my @ffiltered = sort(uniq(@fchars));
  my $fline = "";
  foreach (@ffiltered) {
    $fline .= $_;
  }
  return $fline;
}

open(DATA, "data.txt") or die "Could not open data.txt\n";
@originaldata = <DATA>;
close (DATA);

foreach(@originaldata) {
  $originalline = $_;
    if( $originalline =~ /^\S/ ) {
        chomp $originalline;
        $line .= $originalline
    }
    else {
      $line = fixline($line);
      push (@data, $line);
      $sum += length($line);
      $line = "";
    }
}

$line = fixline($line);
push (@data, $line);
$sum += length($line);
$line = "";

#print Dumper(@data);
print "Part1 = $sum\n";
