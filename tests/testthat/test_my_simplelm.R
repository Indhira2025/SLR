test_that("manual and lm results are similar", {
  x <- 1:10
  y <- 2 + 3 * x + rnorm(10)
  fit1 <- my_simplelm(x, y)
  fit2 <- lm(y ~ x)
  expect_equal(round(fit1$coefficients["x"], 2), round(coef(fit2)[2], 2))
  expect_equal(round(fit1$coefficients["(Intercept)"], 2), round(coef(fit2)[1], 2))
})

