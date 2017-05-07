suppressPackageStartupMessages(library(typed))
context("types")
suppressPackageStartupMessages(library(types))
suppressPackageStartupMessages(library(typeCheck))

test_that("Types definitions work", {
  # iris is a dataframe, volcano is a matrix, AirPassengers is a time series
  all_f <- function(x) all(x == FALSE)

  test_type_checks <- function(Type, good, bad) {
    expect_true(all(sapply(good, Type$check)))
    expect_true(all_f(sapply(bad, Type$check)))
  }

  Atomic <- type("Atomic")
  good <- list(integer(), numeric(), character(), logical(), complex(), raw(), matrix())
  bad <- list(list(), iris)
  test_type_checks(Atomic, good, bad)

  Vector <- type("Vector")
  good <- list(integer(), numeric(), double(), character(), logical(), complex(), raw(), list())
  bad <- list(iris, volcano)
  test_type_checks(Vector, good, bad)

  Numeric <- type("Numeric")
  good <- list(numeric(), integer(), double(), 1:10, 1.0, 1L, volcano, iris$Sepal.Length)
  bad <- list(TRUE, letters, iris)
  test_type_checks(Numeric, good, bad)

  Integer <- type("Integer")
  good <- list(integer(), 1L, 1:10L)
  bad <- list(1.0, TRUE, letters, iris, volcano)
  test_type_checks(Integer, good, bad)

  Logical <- type("Logical")
  good <- list(logical(), TRUE, FALSE, c(TRUE, FALSE), T, F)
  bad <- list(1.0, 1:10, letters, iris, volcano)
  test_type_checks(Logical, good, bad)

  Double <- type("Double")
  good <- list(double(), 1.0, iris$Sepal.Length, volcano)
  bad <- list(1L, TRUE, letters, iris)
  test_type_checks(Double, good, bad)

  Character <- type("Character")
  good <- list(character(), "a", letters)
  bad <- list(1L, TRUE, iris, volcano)
  test_type_checks(Character, good, bad)

  Complex <- type("Complex")
  good <- list(complex(), 1+5i, (0i ^ (-3:3)), matrix(1i ^ (-6:5), nrow = 4))
  bad <- list(1L, TRUE, iris, volcano)
  test_type_checks(Complex, good, bad)

  Raw <- type("Raw")
  good <- list(raw(), charToRaw("Testy McTestFace"), as.raw(5))
  bad <- list(1L, TRUE, iris, volcano)
  test_type_checks(Raw, good, bad)

  Factor <- type("Factor")
  good <- list(factor(), iris$Species, factor(letters))
  bad <- list(1L, TRUE, iris, volcano)
  test_type_checks(Factor, good, bad)

  OrderedFactor <- type("OrderedFactor")
  good <- list(factor(ordered = TRUE), as.ordered(iris$Species), factor(c("a", "b", "c"), ordered = TRUE))
  bad <- list(1L, TRUE, iris, volcano)
  test_type_checks(OrderedFactor, good, bad)

  List <- type("List")
  good <- list(list(), iris, list(a = "a", abc = letters, numbers = 1:10), formals(mean))
  bad <- list(1L, TRUE, volcano)
  test_type_checks(List, good, bad)

  PairList <- type("PairList")
  good <- list(formals(mean), .Options)
  bad <- list(1L, TRUE, volcano, list())
  test_type_checks(PairList, good, bad)

  TimeSeries <- type("TimeSeries")
  good <- list(ts(), ts(1:10), AirPassengers)
  bad <- list(1L, TRUE, volcano, list())
  test_type_checks(TimeSeries, good, bad)

  Finite <- type("Finite")
  good <- list(1, 1L, 0+5i)
  bad <- (Inf)
  test_type_checks(Finite, good, bad)

  Infinite <- type("Infinite")
  good <- list(Inf)
  bad <- list(1, 1L, 0+5i)
  test_type_checks(Infinite, good, bad)

  DataFrame <- type("DataFrame")
  good <- list(iris, data.frame())
  bad <- list(1, list(), 0+5i, volcano)
  test_type_checks(DataFrame, good, bad)

  Matrix <- type("Matrix")
  good <- list(volcano, matrix())
  bad <- list(1, list(), 0+5i, iris)
  test_type_checks(Matrix, good, bad)

  SymMatrix <- type("SymMatrix")
  good <- list(diag(5), matrix())
  bad <- list(volcano)
  test_type_checks(SymMatrix, good, bad)

  Table <- type("Table")
  good <- list(table(rpois(100, 5)))
  bad <- list(1, list(), 0+5i, iris)
  test_type_checks(Table, good, bad)

  Array <- type("Array")
  good <- list(array())

})
