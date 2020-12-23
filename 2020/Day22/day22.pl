#!/usr/bin/env perl

use warnings;
use strict;

my @data = ();
my @player1 = ();
my $p1 = 1;
my $p1decksize = 0;
my @player2 = ();
my $p2 = 0;
my $p2decksize = 0;
my $item;
my $done = 0;
my $move1;
my $move2;
my $i = 0;
my $x = 0;
my $score = 0;

open(DATA, "data.txt") or die "Could not open data.txt: $!\n";
@data = <DATA>;
close (DATA);
chomp @data;

foreach $item (@data) {
  if ($item eq '') {
      next;
  }
  if ($item eq "Player 1:") {
      $p1 = 1;
      $p2 = 0;
      next;
  }
  if ($item eq "Player 2:") {
      $p2 = 1;
      $p1 = 0;
      next;
  }
  if ($p1) {
      push @player1, $item;
  }
  if ($p2) {
      push @player2, $item;
  }
}

$p1decksize = @player1;
$p2decksize = @player2;

print "Player 1 (", $p1decksize, "): ", join(',', @player1), "\n";
print "Player 2 (", $p2decksize, "): ", join(',', @player2), "\n";

$done = 0;
while (!$done) {
  $move1 = shift @player1;
  $move2 = shift @player2;
  if ($move1 > $move2) {
      push @player1, $move1, $move2;
  }
  else {
      push @player2, $move2, $move1;
  }
  $p1decksize = @player1;
  $p2decksize = @player2;
  if (($p1decksize == 0) || ($p2decksize == 0)) {
      $done = 1;
  }
}
if ($p1decksize > 0) {
  print "Player 1 wins!\n";
  $x = 1;
  while ($p1decksize > 0) {
    $score = $score + ($player1[$p1decksize-1] * $x);
    $p1decksize--;
    $x++;
  }
}
else {
  print "Player 2 wins!\n";
  $x = 1;
  while ($p2decksize > 0) {
    $score = $score + ($player2[$p2decksize-1] * $x);
    $p2decksize--;
    $x++;
  }
}
print "Player 1 (", $p1decksize, "): ", join(',', @player1), "\n";
print "Player 2 (", $p2decksize, "): ", join(',', @player2), "\n";

print "Score = ", $score, "\n";

