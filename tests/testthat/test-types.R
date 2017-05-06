suppressPackageStartupMessages(library(typed))
context("types")
suppressPackageStartupMessages(library(types))
suppressPackageStartupMessages(library(typeCheck))

test_that("Types definitions work", {
  # iris is a dataframe, volcano is a matrix, AirPassengers is a time series
  all_f <- function(x) all(x == FALSE)

  Atomic <- type("Atomic")
  good <- list(integer(), numeric(), character(), logical(), complex(), raw(), matrix())
  expect_true(all(sapply(good, Atomic$check)))
  bad <- list(list(), iris)
  expect_true(all_f(sapply(bad, Atomic$check)))

  Vector <- type("Vector")
  good <- list(integer(), numeric(), double(), character(), logical(), complex(), raw(), list())
  expect_true(all(sapply(good, Vector$check)))
  bad <- list(iris, volcano)
  expect_true(all_f(sapply(bad, Vector$check)))

  Numeric <- type("Numeric")
  good <- list(numeric(), integer(), double(), 1:10, 1.0, 1L, volcano, iris$Sepal.Length)
  expect_true(all(sapply(good, Numeric$check)))
  bad <- list(TRUE, letters, iris)
  expect_true(all_f(sapply(bad, Numeric$check)))

  Integer <- type("Integer")
  good <- list(integer(), 1L, 1:10L)
  expect_true(all(sapply(good, Integer$check)))
  bad <- list(1.0, TRUE, letters, iris, volcano)
  expect_true(all_f(sapply(bad, Integer$check)))

  Logical <- type("Logical")
  good <- list(logical(), TRUE, FALSE, c(TRUE, FALSE), T, F)
  expect_true(all(sapply(good, Logical$check)))
  bad <- list(1.0, 1:10, letters, iris, volcano)
  expect_true(all_f(sapply(bad, Logical$check)))

  Double <- type("Double")
  good <- list(double(), 1.0, iris$Sepal.Length, volcano)
  expect_true(all(sapply(good, Double$check)))
  bad <- list(1L, TRUE, letters, iris)
  expect_true(all_f(sapply(bad, Double$check)))

  Character <- type("Character")
  good <- list(character(), "a", letters)
  expect_true(all(sapply(good, Character$check)))
  bad <- list(1L, TRUE, iris, volcano)
  expect_true(all_f(sapply(bad, Character$check)))

  Complex <- type("Complex")
  good <- list(complex(), 1+5i, (0i ^ (-3:3)), matrix(1i ^ (-6:5), nrow = 4))
  expect_true(all(sapply(good, Complex$check)))
  bad <- list(1L, TRUE, iris, volcano)
  expect_true(all_f(sapply(bad, Complex$check)))

  Raw <- type("Raw")
  good <- list(raw(), charToRaw("Testy McTestFace"), as.raw(5))
  expect_true(all(sapply(good, Raw$check)))
  bad <- list(1L, TRUE, iris, volcano)
  expect_true(all_f(sapply(bad, Raw$check)))

  Factor <- type("Factor")
  good <- list(factor(), iris$Species, factor(letters))
  expect_true(all(sapply(good, Factor$check)))
  bad <- list(1L, TRUE, iris, volcano)
  expect_true(all_f(sapply(bad, Factor$check)))

  OrderedFactor <- type("OrderedFactor")
  good <- list(factor(ordered = TRUE), as.ordered(iris$Species), factor(c("a", "b", "c"), ordered = TRUE))
  expect_true(all(sapply(good, OrderedFactor$check)))
  bad <- list(1L, TRUE, iris, volcano)
  expect_true(all_f(sapply(bad, OrderedFactor$check)))

  List <- type("List")
  good <- list(list(), iris, list(a = "a", abc = letters, numbers = 1:10), formals(mean))
  expect_true(all(sapply(good, List$check)))
  bad <- list(1L, TRUE, volcano)
  expect_true(all_f(sapply(bad, List$check)))

  PairList <- type("PairList")
  good <- list(formals(mean), .Options)
  expect_true(all(sapply(good, PairList$check)))
  bad <- list(1L, TRUE, volcano, list())
  expect_true(all_f(sapply(bad, PairList$check)))

  TimeSeries <- type("TimeSeries")
  good <- list(ts(), ts(1:10), AirPassengers)
  expect_true(all(sapply(good, TimeSeries$check)))
  bad <- list(1L, TRUE, volcano, list())
  expect_true(all_f(sapply(bad, TimeSeries$check)))


})
