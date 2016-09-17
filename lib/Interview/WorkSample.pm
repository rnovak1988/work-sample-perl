#!perl

package Interview::WorkSample;

use strict;
use warnings;

use Exporter;

our $VERSION = "1.0.0";
our @EXPORT_OK = qw(new Parse Solution);

=item C<new($$)>

returns a new object containing a single piece of information (the number of test
cases, though I don't know why this is relevant, though it does demonstrate 
encapsulation in a perl object).

=cut

sub new($$) {
    my ($package, $numTests) = @_;
    
    die "Expected package name as first parameter" if $package ne "Interview::WorkSample";

    die "Number of tests was not numeric" if $numTests !~ /^(\d+)$/;

    return bless {T => $numTests}, $package;
}

=item C<Parse($$$)>

each test-case (what it's called in the description) consists of two lines of
input. The first line consists of two integers, N, and K. K is the cancellation
threshold, and N is the number of numbers that are in the class.

Returns a hash object that has all of this data

=cut

sub Parse($$$) {
    my ($self, $line_one, $line_two) = @_;

        # creation of an object for return
    my $test_case = {};

        # the first line consists of two ingegers, separated by standard whitespace
    ($test_case->{N}, $test_case->{K}) = split(/ /, $line_one);

        # The second line should contain N space separated integers
    my @data = split(/ /, $line_two);

        # need to assert that this is the case
    die "Number of students doesn't match expected input" if scalar @data != ($test_case->{N} + 0);

        # if get to this point, all the data lines up, so just assign the value to the internal array
    $test_case->{arrival_time} = @data;

        # and finally return it
    return $test_case;
}

=item C<Solution($$)

subroutine responsible for actually calculating the solution. Takes a single test case as input,
and produces a boolean result (1 or 0)

=cut

sub Solution($$) {
    my ($package, $test_case) = @_;
    
    die "Data in wrong format" if not defined $test_case or
        not defined $test_case->{N} or
        not defined $test_case->{K} or
        not defined $test_case->{arrival_time} or
        ref $test_case->{arrival_time} ne 'ARRAY';

    my ($i, $limit, $count) = (0, scalar $test_case->{arrival_time}, 0);

    while ($i < $limit) {
        
        if (($test_case->{arrival_time}[$i] + 0) <= 0) {
            $count += 1;
        }

        $i += 1;
    }

    return ($count >= ($test_case->{K} + 0));
}


1;
