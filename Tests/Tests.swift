//
//  Tests.swift
//  Tests
//
//  Created by Braden Bowdish on 2/24/18.
//

import XCTest
import Swiftfall
class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRandomCard(){
        let card = Swiftfall.getRandomCard()
        card?.simplePrint()
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
    
    func testVeryFuzzy(){
        let fuzzy = "Black"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        card?.simplePrint()
    }
    
    func testExactVsFuzzy(){
        let exact = "Black Lotus"
        let fuzzy = "Black"
        let cardF = Swiftfall.getCard(fuzzy: fuzzy)
        let cardE = Swiftfall.getCard(exact: exact)
        cardF?.simplePrint()
        cardE?.simplePrint()
    }
    
    func testPurchaseURI(){
        let fuzzy = "Black Lotus"
        let cardF = Swiftfall.getCard(fuzzy: fuzzy)
        cardF?.simplePrint()
    }
    
    func testSetCode(){
        let code = "KTK"
        let set = Swiftfall.getSet(code: code)
        set?.simplePrint()
    }
    
    func testSetCodeNoBlock(){
        let code = "EMA"
        let set = Swiftfall.getSet(code: code)
        set?.simplePrint()
    }
    
    func testSetList(){
        let setlist = Swiftfall.getSetList()
        setlist?.simplePrint()
    }
    
    func testCardList(){
        let cardlist = Swiftfall.getCardList()
        cardlist?.simplePrint()
    }
    
    func testCardListPageNumber(){
        let cardlist = Swiftfall.getCardList(page:6)
        cardlist?.simplePrint()
    }
    
    func testGetter(){
        let card = Swiftfall.getRandomCard()
        print((card?.getCMC())!)
    }
    
    func testPlaneswalker() {
        let jace = Swiftfall.getCard(exact: "Jace Beleren")
        jace?.simplePrint()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            testSetList()
        }
    }
    
}
