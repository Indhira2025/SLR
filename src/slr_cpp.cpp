
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List fit_slr_cpp(NumericVector x, NumericVector y) {
  int n = x.size();
  double xbar = mean(x);
  double ybar = mean(y);

  double beta1 = sum((x - xbar) * (y - ybar)) / sum(pow(x - xbar, 2));
  double beta0 = ybar - beta1 * xbar;

  NumericVector fitted = beta0 + beta1 * x;
  NumericVector residuals = y - fitted;
  double ss_total = sum(pow(y - ybar, 2));
  double ss_res = sum(pow(residuals, 2));
  double r_squared = 1 - ss_res / ss_total;

  return List::create(
    _["Intercept"] = beta0,
    _["Slope"] = beta1,
    _["Fitted"] = fitted,
    _["Residuals"] = residuals,
    _["R_squared"] = r_squared
  );
}
