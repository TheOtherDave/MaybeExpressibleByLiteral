//
//  MaybeExpressibleByDictionaryLiteral.swift
//  
//
//  Created by David Sweeris on 2/24/20.
//

import Swift

public protocol MaybeExpressibleByDictionaryLiteral {
    associatedtype Key : Hashable
    associatedtype Value
    static func tryToExpressWithDictionaryLiteral(dictionaryLiteral elements: [(Self.Key, Self.Value)]) -> Self?
}
extension MaybeExpressibleByDictionaryLiteral {
    static func tryToExpressWithDictionaryLiteral(dictionaryLiteral elements: (Self.Key, Self.Value)...) -> Self? {
        return tryToExpressWithDictionaryLiteral(dictionaryLiteral: elements)
    }
}
