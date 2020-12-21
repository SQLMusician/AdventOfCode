#!/usr/bin/perl

use strict;
use warnings;

open my $fh, '<', 'data.txt' or die "Unable to open file:$!\n";
my %hash = map { split /:|\s+/; } <$fh>;
close $fh;
print "$_ => $hash{$_}\n" for keys %hash;
