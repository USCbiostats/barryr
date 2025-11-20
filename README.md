# barry: Your Go-To Motif Accountant (R Package) <img src="man/figures/logo.svg" width="200px" alt="barry logo" align="right">

<!-- badges: start -->
[![ForeSITE Group](https://github.com/EpiForeSITE/software/raw/e82ed88f75e0fe5c0a1a3b38c2b94509f122019c/docs/assets/foresite-software-badge.svg)](https://github.com/EpiForeSITE)
[![CRAN status](https://www.r-pkg.org/badges/version/barry)](https://CRAN.R-project.org/package=barry)
[![R-CMD-check](https://github.com/USCbiostats/barryr/actions/workflows/r.yml/badge.svg)](https://github.com/USCbiostats/barryr/actions/workflows/r.yml)
[![CRANlogs downloads](https://cranlogs.r-pkg.org/badges/grand-total/barry)](https://cran.r-project.org/package=barry)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/USCbiostats/barryr/blob/master/LICENSE.md)
[![codecov](https://codecov.io/gh/USCbiostats/barry/graph/badge.svg?token=ZB8FVLI7GN)](https://app.codecov.io/gh/USCbiostats/barry)
[![status](https://tinyverse.netlify.app/badge//barry)](https://CRAN.R-project.org/package=barry)
<!-- badges: end -->

## Synopsis

This R package provides [C++ headers](https://github.com/USCbiostats/barry) for the **barry** library, 
a C++ template library for counting sufficient statistics on binary arrays and building discrete 
exponential-family models. The barry library provides free portable C++ source code that is 
resolved entirely at compile-time without linking.

This package aims to make the barry library easily accessible to CRAN packages through the 
`LinkingTo:` field in the `DESCRIPTION` file. By placing these headers in this package, we offer 
a more efficient distribution system for CRAN as replication of this code in the sources of 
other packages is avoided. This follows the same approach as the [BH](https://cran.r-project.org/package=BH) 
package which provides Boost headers for R.

The barry library was created and is maintained by [Dr. George G. Vega Yon](https://ggvy.cl) as part of
his doctoral dissertation ["Essays on Bioinformatics and Social Network Analysis: Statistical and Computational Methods for Complex Systems."](https://digitallibrary.usc.edu/asset-management/2A3BF1WAN5IH)

## Features

The barry C++ library includes the following key features:

* **Sparse arrays**: Efficient handling of sparse binary arrays
* **User-defined count statistics**: Flexible framework for custom statistics
* **Support set constraints**: User-defined constraints on the support set
* **Powerset generation**: Generation of binary array powersets
* **Discrete Exponential Family Models (DEFMs)**: Module for building discrete exponential-family models
* **Pooled DEFMs**: Support for pooled data models
* **Network counters**: Statistics for network analysis including ERGMs (Exponential Random Graph Models)

## Installation

You can install the development version of `barry` from
[GitHub](https://github.com/) with:
    
``` r
devtools::install_github("USCbiostats/barryr")
```

Or from <a href="https://uscbiostats.r-universe.dev/"
target="_blank">R-universe</a> (recommended for the latest development
version):

``` r
install.packages(
  'barry',
  repos = c(
    'https://uscbiostats.r-universe.dev',
    'https://cloud.r-project.org'
  )
)
```

## Usage

To use barry in your R package, add the following to your package's `DESCRIPTION` file:

```
LinkingTo: barry
```

Then in your C++ code, you can include barry headers:

```cpp
#include <barry/barry.hpp>

// Your C++ code using barry here
```

The R package infrastructure tools will automatically set the include flags correctly 
on all architectures supported by R.

## Example

Here is a simple example of using barry to count statistics in a network (from the barry C++ library documentation):

```cpp
// [[Rcpp::depends(barry)]]

#include <Rcpp.h>
#include <barry/barry.hpp>

// [[Rcpp::export]]
Rcpp::NumericVector count_network_stats(
    size_t n,
    std::vector<size_t> source,
    std::vector<size_t> target
) {
  // Creating network 
  netcounters::Network net(n, n, source, target);
  net.set_data(new netcounters::NetworkData, true);
  
  // Creating counter object
  netcounters::NetStatsCounter<> counter(&net);
  
  // Adding statistics to count
  netcounters::counter_edges(counter.get_counters());
  netcounters::counter_mutual(counter.get_counters());
  netcounters::counter_ttriads(counter.get_counters());
  
  // Count and return
  std::vector<double> counts = counter.count_all();
  return Rcpp::wrap(counts);
}

/*** R
# Example usage
n <- 5
source <- c(0, 1, 2, 3, 0, 2)
target <- c(1, 2, 3, 4, 2, 0)
count_network_stats(n, source, target)
*/
```

## Documentation

More information about the barry C++ library can be found:

* [barry C++ library repository](https://github.com/USCbiostats/barry)
* [Doxygen documentation](https://uscbiostats.github.io/barry)
* [PDF documentation](https://github.com/USCbiostats/barry/blob/gh-pages/latex/refman.pdf)

## See Also

Similar header-only R packages:

* [BH](https://cran.r-project.org/package=BH): Boost C++ Header Files
* [RcppArmadillo](https://cran.r-project.org/package=RcppArmadillo): Armadillo C++ linear algebra library
* [RcppEigen](https://cran.r-project.org/package=RcppEigen): Eigen C++ template library

## Code of Conduct

The barry project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
