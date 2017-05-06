#' Try to evaluate an expression
#'
#' If the expression raises an error or warning
#' then try returns FALSE. This is to help
#' writing checks when defining types, in particular
#' comparisons. This solves the problem of
#' "non-numeric argument to binary operator".
#'
#' \code{try()} will only ever return the evaluated
#' expression or FALSE.
#'
#' @param expr An R expression
#' @return The evaluated expression or FALSE
#' @export
#'
#' @examples
#' try("abc" %% 1 == 0) # FALSE
#' type.Probability <- type_define(
#'   check = function(x) { all(try(x >= 0 & x <= 1)) },
#'   size  = length
#'    )

try <- function(expr) {
  tryCatch(
    expr,
    error = function(e) FALSE,
    warning = function(w) FALSE
    )
}
