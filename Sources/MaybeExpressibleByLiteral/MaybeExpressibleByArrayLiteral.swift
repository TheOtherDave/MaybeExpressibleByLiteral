//
//  MaybeExpressibleByArrayLiteral.swift
//  
//
//  Created by David Sweeris on 2/24/20.
//

public protocol MaybeExpressibleByArrayLiteral {
    associatedtype ArrayLiteralElement
    
    // The argument is called `array` instead of `arrayLiteral` because that's for the version in the extension which has a variadic argument.
    static func tryToExpressWithArrayLiteral(array elements: [ArrayLiteralElement]) -> Self?
}

extension MaybeExpressibleByArrayLiteral {
    
    /// I don't think there's a reason to call this version since `elements` will be an array instead of a variadic argument by the time `Optional.init(arrayLiteral: ArrayLiteralElement...)` passes it along to the functions that do the validation. It's just here for completeness, I guess, or if you don't like calling these via `Optional`'s inits.
    static func tryToExpressWithArrayLiteral(arrayLiteral elements: ArrayLiteralElement...) -> Self? {
        tryToExpressWithArrayLiteral(array: elements)
    }
}
