#!/usr/bin/perl

use strict;
use warnings;

my %data = do {
  open my $fh, '<', 'data.txt' or die $!;
  local $/;
  <$fh> =~ /(\w+)\s*:\s*(\w+)/g;
};

use Data::Dump;
dd \%data;
