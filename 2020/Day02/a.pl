#!/usr/bin/perl

use warnings;
use strict;

my $r = "a";
my $s = "a";
my $p = "a";
my $z = "a";

print "#!/usr/bin/perl\n\n";

open(FILE, "data.txt") or die "Could not open data.txt\n";

while(<FILE>) {
  chomp;
  ($r, $s, $p) = split(' ', $_);

  $r =~ s/-/,/; 
  $s =~ s/://;
  $z = "$s\{$r\}";

  print "if (\"$p\" =~ m/$z/) {\n"; 
  print "  print \"Password Okay\\n\";\n";
  print "} else {\n";
  print "  print \"Password Failed\\n\";\n";
  print "}\n";

}
close FILE;
