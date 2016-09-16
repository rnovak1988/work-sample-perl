#!perl

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME => "Interview::WorkSample",
    VERSION_FROM => "lib/Interview/WorkSample.pm",
    EXE_FILES => "bin/work-sample",
    PREREQ_PM => {
    },
    TEST_REQUIRES => {
        "Test::More"
    }
);

