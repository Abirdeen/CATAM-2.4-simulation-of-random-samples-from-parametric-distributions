library(types)
library(docstring)

#' PDF of the exponential distribution.
#'
#' @param x Non-negative float. The sample point.
#' @param rate Positive float. The rate parameter.
#' @return Float. Relative likelihood of `x`.
#' @examples
#' exponential_pdf(0,rate) = rate
#' exponential_pdf(-log(y),1) = y
exponential_pdf <- function(x = ? numeric, rate = ? numeric) {
  return(rate * exp(-x * rate))
}

#' PDF of the gamma distribution.
#'
#' @param x Non-negative float. The sample point.
#' @param n Positive float. The shape parameter.
#' @param theta Positive float. The rate parameter.
#' @return Float. Relative likelihood of `x`.
#' @examples
#' gamma_pdf(0,n,theta) = 0 #n>1 an integer.
#' gamma_pdf(-log(y),1,1) = y
gamma_pdf <- function(x = ? numeric, n = ? numeric, theta = ? numeric) {
  return(theta^n * x^(n - 1) * exp(-theta * x) / gamma(n - 1))
}

#' PDF of the normal distribution.
#'
#' @param x Non-negative float. The sample point.
#' @param mu Float. The mean.
#' @param sigma Positive float. The standard deviation.
#' @return Float. Relative likelihood of `x`.
#' @examples
#' normal_pdf(0,0,sigma) = 1 / (2 * pi * sigma)^(1 / 2)
#' normal_pdf((log(1 / y))^(1 / 2),0,(1 / 2)^(1 / 2)) = y / pi^(1 / 2) #y>1
normal_pdf <- function(x = ? numeric, mu = ? numeric, sigma = ? numeric) {
  return(exp(-(x - mu)^2 / (2 * sigma^2)) / (2 * pi * sigma^2)^(1 / 2))
}

chi_square_pdf <- function(x = ? numeric, k = ? integer) {
  return(gamma_pdf(x, k / 2, 2))
}

#' Provides samples from a given distribution
#'
#' @param distribution Function. The inverse of the distribution function.
#' The parameters must be presupplied, so currying may be needed before calling.
#' @param n Integer. The number of samples
#' @return Vector. The samples.
distribution_sampler <- function(distribution, n = ? numeric) {
  uniform_samples <- runif(n)
  return(sapply(uniform_samples, distribution))
}