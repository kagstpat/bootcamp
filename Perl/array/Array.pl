#!/usr/bin/perl -w
use strict;

#define array
my @array = ("banana","apple","kiwi","orange","pear");

print "### Printing the whole array ###\n";
foreach (@array) {
	print "$_ ";
}

print "\n\n### Printing a single element within array ###\n";
print $array[0] ."\n"; # prints first element in array 1


print "\n### Adding elements to array ###\n";
push(@array, "addedElement");
foreach (@array) {
	print "$_ ";
}

print "\n\n### Removing element from array ###\n";
my $index = 0;
 
#Searches for the index in the array where the element is kiwi
$index++ until $array[$index] eq "kiwi";
splice(@array, $index, 1);
foreach (@array) {
	print "$_ ";
}

my $array = @array;
print "\n\n### Printing the length of an array ###\n";
print "the length of array is $array\n";