#!/usr/bin/perl 
use strict;

my %ages = (
	"Patrik" => 29,
	"Markus" => 25,
	"Björn"  => 23,
	"Mikael" => 51,
	"Thomas" => 30
);

print "Patrik is $ages{Patrik} years old \n\n";

while ((my $key,my $value) = each %ages) {
	print "$key is $ages{$key} years old\n";
}