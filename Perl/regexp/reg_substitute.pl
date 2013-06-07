#!/usr/bin/perl -w
use strict;

my $haiku = "I Wake reluctant
Too cold to get out bed
But I need to pee";

$haiku =~ s/Wake/Raise/;

print "$haiku\n";
