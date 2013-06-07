use strict;
use warnings;

use Test::More 'no_plan';

# Test case 1
use_ok('src::main');

my $formatter = src::main->new;

# Test case 2
isa_ok( $formatter, 'src::main' );

# Test case 3
is( $formatter->main(''), '0', 'Empty arguments should return 0' );

# Test case 4
is( $formatter->main('1 2'), '0', 'Numbers should return 0' );

# Test case 5
is( $formatter->main('r'), 'ror', 'r should return ror' );

# Test case 6
is( $formatter->main('a'), 'a', 'a should return a' );

# Test case 7
is( $formatter->main('aba'), 'aboba', 'aba should return aboba' );

# Test case 8
is( $formatter->main('Patrik'),
	'PoPatotrorikok',
	'The string Patrik should be translated to PoPatotrorikok' );

# Test case 9
is( $formatter->main('Hej du'),
	'HoHejoj dodu', 'Hej du should return HoHejoj dodu' );
