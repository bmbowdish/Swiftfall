import XCTest

class SwiftfallTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertNotNil(Swiftfall.card(fuzzy: "Black Lotus"))
    }

        var allTests = [
        ("testExample", testExample),
    ]
}
