library(types)
library(docstring)

#' CDF of the exponential distribution.
#'
#' @param x Non-negative float. The sample point.
#' @param rate Positive float. The rate parameter.
#' @return Float. If X~Exp(theta), this represents P(X<=`x`).
#' @examples
#' exponential_distribution(0,rate) = 0
#' exponential_distribution(-log(y),1) = 1-y
exponential_distribution <- function(x = ? numeric, rate = ? numeric) {
  return(1 - exp(-x * rate))
}

#' Inverse CDF of the exponential distribution.
#'
#' @param x Non-negative float, 0<=`x`<=1. The sample point.
#' @param rate Positive float. The rate parameter.
#' @return Float. If X~Exp(theta), this represents m such that P(X<=m) = `x`.
#' @examples
#' exponential_distribution(0,theta) = 0
#' exponential_distribution(-log(y),1) = 1-y
exponential_distribution_inv <- function(x = ? numeric, rate = ? numeric) {
  return(-log(1 - x) / rate)
}