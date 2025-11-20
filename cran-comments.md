## R CMD check results

0 errors | 0 warnings | 0 notes

## Test environments

* Local installation
* GitHub Actions (ubuntu-latest, macOS-latest, windows-latest)
* R-hub (as appropriate)

## Submission notes

This is a header-only package that provides C++ headers from the barry library 
for use in other R packages. It follows the same approach as the BH package 
which provides Boost headers.

The package contains:
* C++ header files in inst/include/
* Minimal R documentation 
* No compiled code or R functions (header-only)

This package is similar in structure and purpose to the BH package on CRAN.
