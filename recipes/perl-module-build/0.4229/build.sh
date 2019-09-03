#!/bin/bash

set -xe

# Make sure this goes in site
perl Makefile.PL INSTALLDIRS=site
make
make test
make pure_install

# Add more build steps here, if they are necessary.

# See
# https://docs.conda.io/projects/conda-build
# for a list of environment variables that are set during the build process.
