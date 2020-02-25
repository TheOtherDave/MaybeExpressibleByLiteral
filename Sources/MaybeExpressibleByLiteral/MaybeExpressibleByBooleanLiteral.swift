//
//  MaybeExpressibleByBooleanLiteral.swift
//  
//
//  Created by David Sweeris on 2/24/20.
//

// I don't know how much of a point there is to this one, but, sure, why not...

public protocol MaybeExpressibleByBooleanLiteral {
    associatedtype BooleanLiteralType : _ExpressibleByBuiltinBooleanLiteral
    
    static func tryToExpressWithBooleanLiteral(booleanLiteral value: Self.BooleanLiteralType) -> Self?
}
