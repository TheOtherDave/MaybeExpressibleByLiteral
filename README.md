# MaybeExpressible

Since Swift doesn't have a mechanism for validating literal values within source code (one can dream), this provides a way to let the type system reflect the fact that the `3` in `var x = 3 as MustBeEven?` hasn't actually been checked to see if it's a valid value.

This is designed to be used like `5 as Prime?` or `"House" as CapitalizedWord?`... that sort of pattern.

I could pretty easily be convinced that these requirements ought to be written as failable inits instead of static functions that return a `Self?`. I started doing it this way so that I could write the validation functions without having to worry about initializing all the instance variables when I already knew that `3` wasn't even or whatever. Additionally, all the initializers are defined in conditional conformances such as `Optional : ExpressibleByFloatLiteral where Wrapped : MaybeExpressibleByFloatLiteral`, so the slightly weird syntax doesn't come up at the call site.

Look at the tests for conformance/usage examples. 
