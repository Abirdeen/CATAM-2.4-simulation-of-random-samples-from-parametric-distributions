library(types)
library(docstring)
library(expint)
library(pracma)

#' CDF of the exponential distribution.
#'
#' @param x Non-negative float. The sample point.
#' @param rate Positive float. The rate parameter.
#' @return Float. If X~Exp(rate), this represents P(X<=`x`).
#' @examples
#' exponential_distribution(0, rate) = 0
#' exponential_distribution(-log(y), 1) = 1 - y
exponential_distribution <- function(x = ? numeric, rate = ? numeric) {
  return(1 - exp(-x * rate))
}

#' Inverse CDF of the exponential distribution.
#'
#' @param x Non-negative float, 0<=`x`<=1. The sample point.
#' @param rate Positive float. The rate parameter.
#' @return Float. If X~Exp(rate), this represents m such that P(X<=m) = `x`.
#' @examples
#' exponential_distribution(0, rate) = 0
#' exponential_distribution(-log(y), 1) = 1 - y
exponential_distribution_inv <- function(x = ? numeric, rate = ? numeric) {
  return(-log(1 - x) / rate)
}


#' CDF of the gamma distribution.
#'
#' @param x Non-negative float. The sample point.
#' @param rate Positive float. The rate parameter.
#' @param shape Positive float. The shape parameter.
#' @return Float. If X~Gamma(rate, shape), this represents P(X<=`x`).
#' @examples
#' gamma_distribution(x, rate, 1) = exponential_distribution(x, rate)
#' gamma_distribution(x, rate, 2) = 1 - e^(-rate * x) * (rate * x + 1)
gamma_distribution <- function(x = ? numeric,
                               rate = ? numeric, shape = ? numeric) {
  return(1 - gammainc(shape, rate * x) / gamma(shape))
}

#' Inverse CDF of the gamme distribution of shape 2.
#'
#' @param x Non-negative float, 0<=`x`<=1. The sample point.
#' @param rate Positive float. The rate parameter.
#' @return Float. If X~Gamma(rate,2), this represents m such that P(X<=m) = `x`.
#' @examples
#' gamma_distribution_special_inv(0, rate) = 0
#' gamma_distribution_special_inv(ye^(y+1) + 1, 1) = -1 - y
gamma_distribution_special_inv <- function(x = ? numeric, rate = ? numeric) {
  return(-(lambertWn((x - 1) / exp(1)) + 1) / rate)
}
