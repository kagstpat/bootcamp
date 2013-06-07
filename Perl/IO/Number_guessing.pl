#!/usr/bin/perl -w
use strict;
print "Gissa talet mellan 1-1000\n";
my $tal = int( rand(999) ) + 1;
my $result = 0;
while ($result != 1)
{
	my $gissning = <STDIN>;
	if ( $gissning == $tal )
	{
		print "Du har gissat rätt!\n";
		$result = 1;
	} elsif ( $gissning > $tal )
	{
		print "Du gissade för högt\n";
	} elsif ( $gissning < $tal )
	{
		print "Du gissade för lågt\n";
	}
}
