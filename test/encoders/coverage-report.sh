#!/bin/sh

PWD=`pwd`

lcov --capture --directory . --output-file coverage.info
lcov --output-file coverage.info \
    --remove coverage.info $PWD/testsuite.c  $PWD/mainprogram.c
genhtml coverage.info --output-directory coverage  --no-function-coverage
xdg-open coverage/index.html

