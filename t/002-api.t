#!perl

use Test::More;
use Interview::WorkSample;

use Data::Dumper;

my $num_tests = 0;

my $work_sample = Interview::WorkSample->new(1);

ok(defined $work_sample and ref $work_sample eq 'Interview::WorkSample');
$num_tests++;

my $test_case = $work_sample->Parse("4 3", "-1 -3 4 2");

ok(defined $test_case and ref $test_case eq 'HASH');
$num_tests++;

my $result = $work_sample->Solution($test_case);

ok(defined $result and $result);
$num_tests++;

done_testing($num_tests);


