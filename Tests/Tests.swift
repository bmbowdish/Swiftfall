//
//  Tests.swift
//  Tests
//
//  Created by Braden Bowdish on 2/24/18.
//

import XCTest
class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        var fuzzy = "Shock"
        var card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
        fuzzy = "Flash"
        card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
