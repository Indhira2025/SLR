#' Manual Simple Linear Regression (C++ version)
#'
#' Uses Rcpp C++ code for fast linear regression.
#'
#' @param x Numeric vector (predictor)
#' @param y Numeric vector (response)
#' @param plot Logical. If TRUE, shows scatter plot with regression line.
#' @return A list with Intercept, Slope, Fitted values, Residuals, and R-squared.
#' @examples
#' x <- 1:10
#' y <- 3 + 2*x + rnorm(10)
#' my_simplelm_cpp(x, y, plot = TRUE)
#' @export
my_simplelm_cpp <- function(x, y, plot = TRUE) {
  res <- fit_slr_cpp(x, y)
  if(plot) {
    plot(x, y, main = "Manual Linear Regression (C++)", pch = 19, col = "steelblue")
    abline(a = res$Intercept, b = res$Slope, col = "red", lwd = 2)
  }
  res
}

