((nil . ((compile-command . (concat
			     "R -e \"Rcpp::compileAttributes('..')\" && "
			     "R CMD INSTALL .. && "
			     "R --vanilla < ../tests/testthat/test-CRAN.R")))))
