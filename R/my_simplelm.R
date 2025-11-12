#' Manual Simple Linear Regression (No lm())
#'
#' Computes simple linear regression estimates manually using basic formulas.
#'
#' @param x Numeric vector (predictor)
#' @param y Numeric vector (response)
#' @param plot Logical. If TRUE, shows scatter plot with regression line.
#' @return A list containing intercept, slope, fitted values, residuals, and R-squared.
#' @examples
#' @examples
#' # Example 1: Basic usage
#' x <- 1:10
#' y <- 3 + 2*x + rnorm(10)
#' model <- my_simplelm(x, y)
#' model
#'
#' # Example 2: Show fitted line on a plot
#' my_simplelm(x, y, plot = TRUE)
#'
#' # Example 3: Using custom data
#' set.seed(123)
#' temp <- rnorm(20, mean = 30, sd = 5)
#' pressure <- 50 + 1.8 * temp + rnorm(20, 0, 2)
#' my_simplelm(temp, pressure, plot = TRUE)
#'
#' # Example 4: Compare with built-in lm()
#' lm_fit <- lm(y ~ x)
#' lm_fit$coefficients
#'
#' @export
my_simplelm <- function(x, y, plot = TRUE) {
  if (length(x) != length(y)) stop("x and y must be the same length")

  x_bar <- mean(x)
  y_bar <- mean(y)

  beta1 <- sum((x - x_bar) * (y - y_bar)) / sum((x - x_bar)^2)
  beta0 <- y_bar - beta1 * x_bar

  fitted <- beta0 + beta1 * x
  residuals <- y - fitted

  ss_total <- sum((y - y_bar)^2)
  ss_res <- sum(residuals^2)
  r_squared <- 1 - ss_res / ss_total

  if (plot) {
    plot(x, y, main = "Manual Linear Regression", pch = 19, col = "steelblue")
    abline(a = beta0, b = beta1, col = "red", lwd = 2)
  }

  return(list(
    coefficients = c("(Intercept)" = beta0, "x" = beta1),
    R_squared = r_squared,
    Fitted = fitted,
    Residuals = residuals
  ))
}


