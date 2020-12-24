#!/usr/bin/env perl

use Data::Dumper;

my $datafilename = "data.txt";
my @list;
my @biglist;
my $count = 0;
my $i = 0;

open my $DATAFILE, '<', "$datafilename" or die "$datafilename: $!";
@list = <$DATAFILE>;
close $DATAFILE;

chomp @list;

$count = @list;

foreach my $line (@list) {
  (my $inst, my $opc) = split(/\s+/, $line);
  push(@biglist, ($inst, int($opc)));
}

print Dumper(@biglist);
