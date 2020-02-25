import XCTest
@testable import MaybeExpressibleByLiteral

final class MaybeExpressibleByLiteralTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MaybeExpressibleByLiteral().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
