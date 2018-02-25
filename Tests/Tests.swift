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
    
    func testFuzzySpellSimpleSingleWord() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let fuzzy = "Shock"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
    }
    
    func testFuzzySpellSimpleMultiWord() {
        let fuzzy = "Fatal Push"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
    }
    
    func testFuzzySpellApostrophe() {
        let fuzzy = "Gaea's Blessing"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
    }
    
    func testExactSpellSimpleSingleWord() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let exact = "Shock"
        let card = Swiftfall.getCard(exact: exact)
        card?.simplePrint()
    }
    
    func testExactSpellSimpleMultiWord() {
        let exact = "Fatal Push"
        let card = Swiftfall.getCard(exact: exact)
        card?.simplePrint()
    }
    
    func testExactSpellApostrophe() {
        let exact = "Gaea's Blessing"
        let card = Swiftfall.getCard(exact: exact)
        card?.simplePrint()
    }
    
    func testFuzzyCreatureSimpleSingleWordStringPowerStringTough(){
        let fuzzy = "Tarmogoyf"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
    }
    
    func testFuzzyCreatureSimpleSingleWord(){
        let fuzzy = "Triskelion"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
    }
    
    func testExactCreatureApostrophe(){
        let exact = "Abu Ja'far"
        let card = Swiftfall.getCard(exact: exact)
        card?.simplePrint()
    }
    
    func testExactNotMTGO(){
        let exact = "Flash"
        let card = Swiftfall.getCard(exact: exact)
        card?.simplePrint()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
