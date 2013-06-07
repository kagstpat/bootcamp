package src::main;
use Moose;

sub main {
	my ( $self, $text ) = @_;
	my @tmp;
	my $result = "";
	if ( $text =~ /\d+/ || length($text) == 0 ) {
		return 0;
	}

	@tmp = split( //, $text );

	foreach my $letter (@tmp) {

		if (   $letter =~ /a/
			|| $letter =~ /A/
			|| $letter =~ /e/
			|| $letter =~ /E/
			|| $letter =~ /i/
			|| $letter =~ /I/
			|| $letter =~ /o/
			|| $letter =~ /O/
			|| $letter =~ /u/
			|| $letter =~ /U/
			|| $letter =~ /y/
			|| $letter =~ /Y/ )
		{
			$result = $result . $letter;
		}

		elsif ( $letter =~ /\s+/ ) {
			$result = $result . " ";
		}
		else {
			$result = $result . $letter . "o" . $letter;
		}

	}

	return $result;

}
1;

