# typed
Common Types for use with TypeCheck in R

typed defines common types so you don't have to. typed complements 
[types](https://github.com/jimhester/types) and [typeCheck](https://github.com/jimhester/typeCheck), 
packages for annotating and type checking R functions. Load typed 
and use well tested types like `Numeric`, `Matrix`, `DataFrame`, `Function` and many more. 

typed is inspired by 
[DefinitelyTyped](http://definitelytyped.org/) "the repository for high quality TypeScript type definitions".

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
If you're more of a `snake_case` kind of person, you can use `type_alias()` to create an alias.

```r
type.numeric <- type_alias(Numeric)
```

While R will never be strictly typed (that's one of its greatest features!), 
optional types are a wonderful addition for R developers who want them.

typed is an experiment in writing strictly typed R code. 
R's origins have resulted in a complicated and little understood hierarchy of 
informal types. types, typeCheck and typed provide a clean interface to work from. 


