#!perl

package Interview::WorkSample;

use strict;
use warnings;

use Exporter;

our $VERSION = "1.0.0";
our @EXPORT_OK = qw(new Parse Solution);

sub new() {
    return bless {}, 'Interview::WorkSample';
}

sub Parse($$) {
    my ($package, $input) = @_;

    my ($args, @lines) = ({}, split("\n", $input));

    $args->{num_test_cases} = shift @lines;
    $args->{test_case} = [];
    
    while (@lines) {
        my $test_case = {};

        ($test_case->{N}, $test_case->{K}) = split(" ", shift(@lines));

        $test_case->{data} = split(" ", shift(@lines));

        push($args->{test_case}, $test_case);
    }

    return $args;
}

sub Solution($;$) {
    my ($package, $input) = @_;

    $input = $package if ref $package eq 'Interview::WorkSample';

    my $output = "";
    


    return $output;
}


1;
