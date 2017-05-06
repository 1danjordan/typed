type_define <- typeCheck::type_define

#' Common types for annotating and type checking functions
#' @export
type.Atomic      <- type_define(is.atomic,     size = length)
type.Vector      <- type_define(is.vector,     size = length)
type.Numeric     <- type_define(is.numeric,    size = length)
type.Integer     <- type_define(is.integer,    size = length)
type.Logical     <- type_define(is.logical,    size = length)
type.Double      <- type_define(is.double,     size = length)
type.Character   <- type_define(is.character,  size = length)
type.Complex     <- type_define(is.complex,    size = length)
type.Raw         <- type_define(is.raw,        size = length)

type.Factor      <- type_define(is.factor,     size = length)
type.OrderedFactor <- type_define(is.ordered,  size = length)
type.List        <- type_define(is.list,       size = length)
type.PairList    <- type_define(is.pairlist,   size = length)
type.Unsorted    <- type_define(is.unsorted,   size = length)
type.TimeSeries  <- type_define(is.ts,         size = length)

type.NA_type     <- type_define(is.na)
type.NULL_type   <- type_define(is.null,       size = function(){ 0 })

type.NAN         <- type_define(is.nan,        size = length)
type.Finite      <- type_define(is.finite,     size = length)
type.Infinite    <- type_define(is.infinite,   size = length)

# 2D Types
type.DataFrame   <- type_define(is.data.frame, size = dim)
type.Matrix      <- type_define(is.matrix,     size = dim)
type.SymMatrix   <- type_define(isSymmetric,   size = dim)
type.Table       <- type_define(is.table,      size = dim)
type.Leaf        <- type_define(is.leaf)

# Multidimensional Types
type.Array       <- type_define(is.array,      size = dim)
type.Raster      <- type_define(is.raster,     size = dim)

# Language Types
type.Function    <- type_define(is.function)
type.Primitive   <- type_define(is.primitive)
type.Environment <- type_define(is.environment, size = length)
type.Call        <- type_define(is.call)
type.Expression  <- type_define(is.expression)
type.Object      <- type_define(is.object)
type.Name        <- type_define(is.name)
type.Symbol      <- type_define(is.symbol)

# Custom Types
type.Probability <- type_define(
  check = function(x){ try(all(x >= 0 & x <= 1)) },
  size  = length
  )
type.Natural     <- type_define(
  check = function(x) { try(all(x > 0)) },
  size  = length
)
type.WholeNumber <- type_define(
  check = function(x) { try(all(x %% 1 == 0)) },
  size  = length
)
