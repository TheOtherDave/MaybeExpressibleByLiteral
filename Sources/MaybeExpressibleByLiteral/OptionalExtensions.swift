//
//  File.swift
//  
//
//  Created by David Sweeris on 2/24/20.
//

import Foundation

extension Optional : ExpressibleByUnicodeScalarLiteral, ExpressibleByExtendedGraphemeClusterLiteral, ExpressibleByStringLiteral where Wrapped : MaybeExpressibleByStringLiteral {
    public init(unicodeScalarLiteral value: String.UnicodeScalarLiteralType) {
        self = Wrapped.tryToExpressWithUnicodeScalarLiteral(unicodeScalarLiteral: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: String.ExtendedGraphemeClusterLiteralType) {
        self = Wrapped.tryToExpressWithExtendedGraphemeClusterLiteral(extendedGraphemeClusterLiteral: value)
    }
    
    public init(stringLiteral value: Wrapped.StringLiteralType) {
        self = Wrapped.tryToExpressWithStringLiteral(stringLiteral: value)
    }
}

extension Optional : ExpressibleByDictionaryLiteral where Wrapped : MaybeExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (Wrapped.Key, Wrapped.Value)...) {
        self = Wrapped.tryToExpressWithDictionaryLiteral(dictionaryLiteral: elements)
    }
}

extension Optional : ExpressibleByIntegerLiteral where Wrapped : MaybeExpressibleByIntegerLiteral {
    public init(integerLiteral value: Wrapped.IntegerLiteralType) {
        self = Wrapped.tryToExpressWithIntegerLiteral(integerLiteral: value)
    }
}

extension Optional : ExpressibleByFloatLiteral where Wrapped : MaybeExpressibleByFloatLiteral {
    public init(floatLiteral value: Wrapped.FloatLiteralType) {
        self = Wrapped.tryToExpressWithFloatLiteral(floatLiteral: value)
    }
}

extension Optional : ExpressibleByArrayLiteral where Wrapped : MaybeExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Wrapped.ArrayLiteralElement...) {
        self = Wrapped.tryToExpressWithArrayLiteral(array: elements)
    }
}

extension Optional : ExpressibleByBooleanLiteral where Wrapped : MaybeExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Wrapped.BooleanLiteralType) {
        self = Wrapped.tryToExpressWithBooleanLiteral(booleanLiteral: value)
    }
}
