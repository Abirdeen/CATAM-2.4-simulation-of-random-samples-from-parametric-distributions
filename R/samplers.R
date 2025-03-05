#' Provides samples from invertible distributions.
#'
#' @param distribution Function. The inverse of the distribution function.
#' The parameters must be presupplied, so currying may be needed before calling.
#' @param n Integer. The number of samples.
#' @return Vector. The samples.
distribution_sampler <- function(distribution, n = ? numeric) {
  uniform_samples <- runif(n)
  return(sapply(uniform_samples, distribution))
}

#' Provides samples from a normal distribution
#'
#' @param n Integer. The number of samples.
#' @param mean Float. The mean.
#' @param variance Float. The variance.
#' @return Vector. The samples.
normal_distribution_sampler <- function(n = ? numeric,
                                        mean = ? numeric,
                                        variance = ? numeric) {
  uniform_samples_1 <- runif(n)
  uniform_samples_2 <- runif(n)
  phi <- sapply(uniform_samples_1, function(x) {
                                                2 * pi * x })
  v <- sapply(uniform_samples_2, function(x) {
                                              -2 * log(1 - x) })
  return(mean + sqrt(variance) * sqrt(v) * sin(phi))
}

#' Provides samples from a normal distribution
#'
#' @param n Integer. The number of samples.
#' @param k Integer. The degrees of freedom.
#' @return Vector. The samples.
chi_square_sampler <- function(n = ? numeric, k = ? numeric) {
  results <- c()
  for (i in 1: n) {
    sample <- sum(normal_distribution_sampler(k, 0, 1)^2)
    results <- c(results, sample)
  }
  return(results)
}