#!perl

use Test::More;
use Interview::WorkSample;

my $num_tests = 0;

my @data = (
    ["4 3", "-1 -3 4 2", 1],
    ["4 2", "0 -1 2 1", 0]
);

my $work_sample = Interview::WorkSample->new(scalar @data);

for $case (@data) {

    my $test = $work_sample->Parse($case->[0], $case->[1]);
   
    my $result = $work_sample->Solution($test);

    ok(defined $result and $result == $case->[2]);
    $num_tests++;
}

done_testing($num_tests);
