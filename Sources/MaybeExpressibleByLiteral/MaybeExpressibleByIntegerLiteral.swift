//
//  MaybeExpressibleByIntegerLiteral.swift
//  
//
//  Created by David Sweeris on 2/24/20.
//

public protocol MaybeExpressibleByIntegerLiteral {
    associatedtype IntegerLiteralType : _ExpressibleByBuiltinIntegerLiteral
    
    static func tryToExpressWithIntegerLiteral(integerLiteral value: Self.IntegerLiteralType) -> Self?
}
