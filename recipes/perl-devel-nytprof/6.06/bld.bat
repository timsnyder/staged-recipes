:: Make sure this goes in site
perl Makefile.PL INSTALLDIRS=site LIBS="-L%PREFIX%/lib -lz"
IF %ERRORLEVEL% NEQ 0 exit 1
make
IF %ERRORLEVEL% NEQ 0 exit 1
make test
IF %ERRORLEVEL% NEQ 0 exit 1
make pure_install

:: Add more build steps here, if they are necessary.

:: See
:: https://docs.conda.io/projects/conda-build
:: for a list of environment variables that are set during the build process.
