#!/usr/bin/perl -w
use strict;

# Subrutine that returns a string
sub subPrint() {
	return "This is a subrutine call\n";
}

# Subrutine that takes an optional variable as argument
sub subArgument {

	print "@_\n";
}

#Subrutine for multiple required arguments
sub subMultiArguments($$$) {
	my ($first, $second, $third) = @_;
	print "$first $second $third \n";
}

### Main ###
print subPrint();

my $variable = "this is a subrutine call with an argument";
subArgument($variable);

subMultiArguments("test1", "test2", "test3");
