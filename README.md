# typed
Common Types for use with TypeCheck in R

typed gives you common types so you don't have to. typed complements types and typeCheck, 
packages for annotating and type checking R functions. All you have to do is load typed
and get on with writiing type safe R code.

```r
library(typed)

binom <- function(p = ? Probability, k = ? Natural, n = ? Natural) {
    choose(n, k) * p^k * (1 - p)^(n - k)
} ? Probability

typed_binom <- type_check(binom)

type_binom(0.5, 1, 1)
[1] 0.5

typed_binom(2L, 1, 1)
Error: `p` is a `integer` not a `Probability` 

typed_binom(0.5, -2, 0)
Error: `k` is a `double` not a `Natural`
```

Currently there are around 50 defined types.
List all the available types with `methods("type")`.

```r
methods("type")

[1] type.Array         type.Atomic        type.Call          type.Character     type.Complex      
[6] type.convert       type.DataFrame     type.default*      type.Double        type.Environment  
[11] type.Expression    type.Factor        type.Finite        type.Function      type.Infinite     
[16] type.Integer       type.Leaf          type.List          type.Logical       type.Matrix  
[21] ...  
```


While R will never be strictly typed (that's one of its greatest features!), 
optional types are a wonderful addition for R developers who want them.

typed is an experiment in writing strictly typed R code. 
R's origins have resulted in a complicated and little understood hierarchy of 
informal types. types, typeCheck and typed provide a clean interface to work from. 

If you don't like upper case type names, you can use `type_alias()`.

```r
type.numeric <- type_alias(Numeric)
```

