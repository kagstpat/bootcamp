#!/usr/bin/perl -w
use strict;

my $haiku = "I Wake reluctant
Too cold to get out bed
But I need to pee";


if( $haiku =~ m/bed/) {
  print "Text bed exists\n";
}

if($haiku =~ m/Bed/) {
  print "Text Bed does not exist, will not print\n";
}

my $ip = "192.168.118.5";
if($ip =~ m/(\d+).(\d+).(\d+).(\d+)/) {
  print "$1 $2 $3 $4\n";
}

my $xml = "<xml>loads of text here</xml>";
($xml) = $xml =~ m/<xml>(.*)<\/xml>/;
print "$xml\n";

