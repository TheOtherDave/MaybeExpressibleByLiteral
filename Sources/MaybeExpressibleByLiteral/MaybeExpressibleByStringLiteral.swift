//
//  MaybeExpressibleByStringLiteral.swift
//
//
//  Created by David Sweeris on 2/24/20.
//

import Swift

// Ok, so originally this was supposed to mirror the `ExpressibleByStringLiteral` family of protocols and let you typealias all the things and it'd have default implementations if you did the normal deal where everything's just `String` and `String.UnicodeScalarLiteralType` and so on. Somewhere along the line type inference in protocol conformance got either nerfed or removed all together or maybe I'm just doing it wrong. In any case, it was making me typealias all the things whether I wanted to or not, and since the whole point of this is convenience I just made it take the regular stringish types which is almost certainly what you want anyway. The `StringLiteralType` typealias is still in the protocol I guess as some sort of silent reminder that this isn't quite right.

public protocol MaybeExpressibleByStringLiteral {
//    associatedtype StringLiteralType : _ExpressibleByBuiltinStringLiteral
//    associatedtype UnicodeScalarLiteralType : _ExpressibleByBuiltinUnicodeScalarLiteral
//    associatedtype ExtendedGraphemeClusterLiteralType : _ExpressibleByBuiltinExtendedGraphemeClusterLiteral
    typealias StringLiteralType = String

//    static func tryToExpressWithUnicodeScalarLiteral(unicodeScalarLiteral value: Self.UnicodeScalarLiteralType) -> Self?
    static func tryToExpressWithUnicodeScalarLiteral(unicodeScalarLiteral value: StringLiteralType.UnicodeScalarLiteralType) -> Self?
//    static func tryToExpressWithExtendedGraphemeClusterLiteral(extendedGraphemeClusterLiteral value: Self.ExtendedGraphemeClusterLiteralType) -> Self?
    static func tryToExpressWithExtendedGraphemeClusterLiteral(extendedGraphemeClusterLiteral value: StringLiteralType.ExtendedGraphemeClusterLiteralType) -> Self?
//    static func tryToExpressWithStringLiteral(stringLiteral value: Self.StringLiteralType) -> Self?
    static func tryToExpressWithStringLiteral(stringLiteral value: StringLiteralType) -> Self?
}

extension MaybeExpressibleByStringLiteral {
    public static func tryToExpressWithUnicodeScalarLiteral(unicodeScalarLiteral value: StringLiteralType.UnicodeScalarLiteralType) -> Self? {
        tryToExpressWithStringLiteral(stringLiteral: "\(value)")
    }
    public static func tryToExpressWithExtendedGraphemeClusterLiteral(extendedGraphemeClusterLiteral value: StringLiteralType.ExtendedGraphemeClusterLiteralType) -> Self? {
        tryToExpressWithStringLiteral(stringLiteral: "\(value)")
    }
}
