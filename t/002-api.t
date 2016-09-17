#!perl

use Test::More;
use Interview::WorkSample;

my $num_tests = 0;

my $work_sample = Interview::WorkSample->new(1);

ok(defined $work_sample and ref $work_sample eq 'Interview::WorkSample');
$num_tests++;

done_testing($num_tests);


