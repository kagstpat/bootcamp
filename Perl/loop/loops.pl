#!/usr/bin/perl -w

my $i;
### for loop ###
for($i = 0; $i < 10; $i++) {
	print $i . "\n";
}
print "\n";

### while ###
while ($i > 0) {
	print $i . "\n";
	$i--;
}
print "\n";

#foreach
my @array = ("apple", "kiwi", "banana", "pear", "orange", "peach");
foreach (@array) {
	print $_ ." ";
}