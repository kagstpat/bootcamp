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
		print "Du har gissat r�tt!\n";
		$result = 1;
	} elsif ( $gissning > $tal )
	{
		print "Du gissade f�r h�gt\n";
	} elsif ( $gissning < $tal )
	{
		print "Du gissade f�r l�gt\n";
	}
}
