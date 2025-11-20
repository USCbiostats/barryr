#' barry: C++ Headers for the barry Library
#'
#' @description
#' Provides C++ header-only files for the barry library, which is a template 
#' library for counting sufficient statistics on binary arrays and building 
#' discrete exponential-family models. The barry library includes tools for
#' sparse arrays, user-defined count statistics, support set constraints,
#' powerset generation, and modules for Discrete Exponential Family Models 
#' (DEFMs) and network statistics.
#'
#' @details
#' This package follows the same approach as the BH package which provides 
#' Boost headers for R. To use barry in your R package, add `LinkingTo: barry` 
#' to your DESCRIPTION file. The headers will then be available for inclusion 
#' in your C++ code via `#include <barry/barry.hpp>`.
#'
#' The barry library was created by Dr. George G. Vega Yon as part of his 
#' doctoral dissertation and provides a general framework for building discrete 
#' exponential-family models, particularly useful for Exponential Random Graph 
#' Models (ERGMs) and other network statistics.
#'
#' @keywords internal
"_PACKAGE"
