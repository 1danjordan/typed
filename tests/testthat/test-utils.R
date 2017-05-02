suppressPackageStartupMessages(library(typed))
context("test utils")

test_that("try evaluates correctly", {
  expect_equal(try(10), 10)
  expect_true(try(5 < 10))
  expect_false(try(rnorm("abc")))
  expect_false((try("abc" %% 1 == 0)))
})
