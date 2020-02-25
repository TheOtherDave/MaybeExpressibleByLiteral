//
//  MaybeExpressibleByFloatLiteral.swift
//  
//
//  Created by David Sweeris on 2/24/20.
//

public protocol MaybeExpressibleByFloatLiteral {
    associatedtype FloatLiteralType : _ExpressibleByBuiltinFloatLiteral
    
    static func tryToExpressWithFloatLiteral(floatLiteral value: Self.FloatLiteralType) -> Self?
}
