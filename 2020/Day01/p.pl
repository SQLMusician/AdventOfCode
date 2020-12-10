#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;

my @data1 = ();
my @set = ();
my $value1 = 0;
my $value2 = 0;

#
# Set ideas came from this site: https://coderwall.com/p/uawhga/perl-sets
# usage: create_from(@array);
# returns @set
sub create_from {
    my @a = @_;
    my %seen = ();
    my @uniq;
    foreach my $item (@a) {
        push(@uniq, $item) unless $seen{$item}++;
    }
    return @uniq;
}

# usage: is_element_of($element,@set);
# returns 1 if $element is a member of @set
sub is_element_of {
    my $item = shift;
    return 1 if grep { $item eq $_ }@_;
}

sub part_one {
  my @a = shift;
  foreach my $num (@a) {
    if (is_element_of(2020 - $num, @_)) {
      return $num * (2020 - $num);
    }
  }
}

open(DATA, "data.txt") or die "Could not open data.txt\n";
@data1 = <DATA>;
close (DATA);

chomp (@data1);

@set = create_from(@data1);

$value1 = part_one(\@data1, \@set);
print "Part 1: $value1\n";
