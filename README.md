# MaybeExpressible

Since Swift doesn't have a mechanism for validating literal values within source code (one can dream), this provides a way to let the type system reflect the fact that the `3` in `var x = 3 as MustBeEven?` hasn't actually been checked to see if it's a valid value.
