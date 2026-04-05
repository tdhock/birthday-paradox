library(testthat)
test_that("cumprod_interface works for vector size 2", {
  out <- cumprod::cumprod_interface(3:4)
  expect_equal(out, c(3,12))
})
