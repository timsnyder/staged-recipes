## About

This repo is an internal fork of https://github.com/conda-forge/staged-recipes.

The main purpose of having this internal fork is so that we can leverage the Docker-based
`.circleci/run_docker_build.sh` script that will build all recipes contained in the `recipes/`
subfolder in the correct order by building a graph of the dependencies.

You should work on the `sarc` branch in this repo  it contains changes unique to SARC that
will not be upstreamed into `master`

Please contact t.snyder@samsung.com with any questions.
