//
//  MaybeExpressibleByArrayLiteral.swift
//  
//
//  Created by David Sweeris on 2/24/20.
//

public protocol MaybeExpressibleByArrayLiteral {
    associatedtype ArrayLiteralElement
    static func tryToExpressWithArray(array elements: [ArrayLiteralElement]) -> Self?
}

extension MaybeExpressibleByArrayLiteral {
    static func tryToExpressWithArrayLiteral(arrayLiteral elements: ArrayLiteralElement...) -> Self? {
        tryToExpressWithArray(array: elements)
    }
}
