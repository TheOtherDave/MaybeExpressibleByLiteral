import XCTest
@testable import MaybeExpressibleByLiteral

final class MaybeExpressibleByLiteralTests: XCTestCase {
    
    // A bunch of types that conform to the `MaybeExpressibleBy*` protocols.
    
    struct OnlyEven : MaybeExpressibleByIntegerLiteral, Equatable {
        static func tryToExpressWithIntegerLiteral(integerLiteral value: Int) -> MaybeExpressibleByLiteralTests.OnlyEven? {
            value.isMultiple(of: 2) ? OnlyEven(value: value) : nil
        }
        var value: Int
    }
    
    struct StartsWithA : MaybeExpressibleByStringLiteral, Equatable {
        static func tryToExpressWithStringLiteral(stringLiteral value: StringLiteralType) -> MaybeExpressibleByLiteralTests.StartsWithA? {
            value.starts(with: "A") ? StartsWithA(value: value) : nil
        }
        
        var value: String
    }
    
    struct ThreeElements<T: Equatable> : MaybeExpressibleByArrayLiteral, Equatable {
        static func tryToExpressWithArray(array elements: [T]) -> MaybeExpressibleByLiteralTests.ThreeElements<T>? {
            elements.count == 3 ? ThreeElements(elements: elements) : nil
        }
        
        var elements: [T]
    }
    
    struct ValuesAreMultiplesOfKeys : MaybeExpressibleByDictionaryLiteral {
        static func tryToExpressWithDictionaryLiteral(dictionaryLiteral elements: [(Int, Int)]) -> MaybeExpressibleByLiteralTests.ValuesAreMultiplesOfKeys? {
            elements.allSatisfy { $0.1.isMultiple(of: $0.0) } ? ValuesAreMultiplesOfKeys(elements: elements) : nil
        }

        var elements: [Int : Int] = [:]
        init(elements: [(Int, Int)]) {
            for (key, value) in elements {
                self.elements[key] = value
            }
        }
    }
    
    struct LessThanPi : MaybeExpressibleByFloatLiteral {
        static func tryToExpressWithFloatLiteral(floatLiteral value: Double) -> MaybeExpressibleByLiteralTests.LessThanPi? {
            value < .pi ? LessThanPi(value: value) : nil
        }
        
        var value: Double
    }
    
    struct AlwaysTrueWaitWhyWouldYouDoThis : MaybeExpressibleByBooleanLiteral {
        static func tryToExpressWithBooleanLiteral(booleanLiteral value: Bool) -> MaybeExpressibleByLiteralTests.AlwaysTrueWaitWhyWouldYouDoThis? {
            value ? AlwaysTrueWaitWhyWouldYouDoThis(value: value) : nil
        }
        var value : Bool
    }
    
    func testExample() {
        XCTAssertNil(3 as OnlyEven?)
        XCTAssertNotNil(2 as OnlyEven?)
        
        XCTAssertNil("a String" as StartsWithA?)
        XCTAssertNotNil("A String" as StartsWithA?)
        
        XCTAssertNil([1,2,3,4] as ThreeElements<Int>?)
        XCTAssertNotNil([1,2,3] as ThreeElements<Int>?)

        XCTAssertNil([1:2, 3:4] as ValuesAreMultiplesOfKeys?)
        XCTAssertNotNil([1:2, 3:6] as ValuesAreMultiplesOfKeys?)
        
        XCTAssertNil(4.0 as LessThanPi?)
        XCTAssertNotNil(3.141 as LessThanPi?)
        
        XCTAssertNil(false as AlwaysTrueWaitWhyWouldYouDoThis?)
        XCTAssertNotNil(true as AlwaysTrueWaitWhyWouldYouDoThis?)

    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
