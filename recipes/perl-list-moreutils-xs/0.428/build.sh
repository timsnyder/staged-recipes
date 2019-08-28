#!/bin/bash

set -xe

# Perl was built with LDFLAGS assuming LD would be called via gcc wrapper, not directly
# MakeMaker will hit :
#    /home/conda/staged-recipes/build_artifacts/perl-list-moreutils-xs_1567021362756/_build_env/bin/x86_64-conda_cos6-linux-gnu-ld: unrecognized option '-Wl,-O2'                                                                                                                   
#    /home/conda/staged-recipes/build_artifacts/perl-list-moreutils-xs_1567021362756/_build_env/bin/x86_64-conda_cos6-linux-gnu-ld: use the --help option for usage information                                                                                                     
#    Can't produce loadable XS module at inc/Config/AutoConf/LMU.pm line 73.                                            
# If we don't override LD.
# NOTE: the LDFLAGS are coming from Config.pm in that case.  Overriding LDFLAGS doesn't do anything.
export LD="$CC"

# If it has Build.PL use that, otherwise use Makefile.PL
if [ -f Build.PL ]; then
    perl Build.PL
    perl ./Build
    perl ./Build test
    # Make sure this goes in site
    perl ./Build pure_install --installdirs site
elif [ -f Makefile.PL ]; then
    # Make sure this goes in site
    perl Makefile.PL INSTALLDIRS=site
    make
    make test
    make pure_install
else
    echo 'Unable to find Build.PL or Makefile.PL. You need to modify build.sh.'
    exit 1
fi

# Add more build steps here, if they are necessary.

# See
# https://docs.conda.io/projects/conda-build
# for a list of environment variables that are set during the build process.
