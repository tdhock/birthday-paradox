#include <Rcpp.h>
#include "cumprod.h"
// [[Rcpp::export]]
Rcpp::NumericVector cumprod_interface(Rcpp::NumericVector in_vec){
  int size = in_vec.size();
  Rcpp::NumericVector out_vec(size);
  int status = cumprod(in_vec.begin(), size, out_vec.begin());
  return out_vec;
}
