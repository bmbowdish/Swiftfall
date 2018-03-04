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
    
    func testRulingList() {
        let rulings = Swiftfall.getRulingList(code: "ima", number: 65)
        //let ruling = rulings?.getData(index: 1)
        //ruling?.simplePrint()
        XCTAssertTrue(rulings?.getData(index: 0)?.getSource() == "wotc")
    }
    
    func testRandomCard(){
        let card = Swiftfall.getRandomCard()
        XCTAssertTrue(card != nil)
    }
    
    func testFuzzySpellSimpleSingleWord() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let fuzzy = "Shock"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssertTrue(nil != card?.getName())
    }
    
    func testFuzzySpellSimpleMultiWord() {
        let fuzzy = "Fatal Push"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssertTrue(nil != card?.getName())
    }
    
    func testFuzzySpellApostrophe() {
        let fuzzy = "Gaea's Blessing"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssertTrue(nil != card?.getName())
    }
    
    func testExactSpellSimpleSingleWord() {
        let exact = "Shock"
        let card = Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssertTrue(exact == card?.getName())
    }
    
    func testExactSpellSimpleMultiWord() {
        let exact = "Fatal Push"
        let card = Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssertTrue(exact == card?.getName())
    }
    
    func testExactSpellApostrophe() {
        let exact = "Gaea's Blessing"
        let card = Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssertTrue(exact == card?.getName())
    }
    
    func testFuzzyCreatureSimpleSingleWordStringPowerStringTough(){
        let fuzzy = "Tarmogoyf"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssert((card?.getPower() != nil))
    }
    
    func testFuzzyCreatureSimpleSingleWord(){
        let fuzzy = "Triskelion"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssert((card?.getPower() != nil))
    }
    
    func testExactCreatureApostrophe(){
        let exact = "Abu Ja'far"
        let card = Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssert(card?.getPower() != nil)
    }
    
    func testExactNotMTGO(){
        let exact = "Flash"
        let card = Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssertTrue(card != nil)
    }
    
    func testVeryFuzzy(){
        let fuzzy = "austere"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        // This intentionally fails.
        XCTAssertTrue(card != nil)
    }
    
    func testExactVsFuzzy(){
        let exact = "Austere Command"
        let fuzzy = "Aust Com"
        let cardF = Swiftfall.getCard(fuzzy: fuzzy)
        let cardE = Swiftfall.getCard(exact: exact)
        XCTAssertTrue(cardF?.getName() == cardE?.getName())
    }
    
    func testPurchaseURI(){
        let fuzzy = "Black Lotus"
        let card = Swiftfall.getCard(fuzzy: fuzzy)
        //cardF?.simplePrint()
        XCTAssertTrue(card?.getPurchaseURIs()["ebay"] != nil)
    }
    
    func testSetCode(){
        let code = "KTK"
        let set = Swiftfall.getSet(code: code)
        //set?.simplePrint()
        XCTAssertTrue((set != nil))
    }
    
    func testSetCodeNoBlock(){
        let code = "EMA"
        let set = Swiftfall.getSet(code: code)
        //set?.simplePrint()
        XCTAssertTrue(set != nil)
        XCTAssertTrue(set?.getBlock() == nil)
    }
    
    func testSetList(){
        let setlist = Swiftfall.getSetList()
        //setlist?.simplePrint()
        XCTAssertTrue(setlist != nil)
    }
    
    func testCardList(){
        let cardlist = Swiftfall.getCardList()
        //cardlist?.simplePrint()
        XCTAssertTrue(cardlist != nil)
    }
    
    func testCardListPageNumber(){
        let cardlist = Swiftfall.getCardList(page:2)
        //cardlist?.simplePrint()
        XCTAssertTrue(cardlist != nil)
    }
    
    func testPlaneswalker() {
        let jace = Swiftfall.getCard(exact: "Jace Beleren")
        //jace?.simplePrint()
        XCTAssertTrue(jace != nil)
    }
    
    func testImageURIs() {
        let card = Swiftfall.getRandomCard()
        XCTAssert(card?.getImageURIs() != nil)
    }
    
    func testDoubleFaced(){
        let card = Swiftfall.getCard(fuzzy: "Jace Vryn's Prodigy")
        let faces = card?.getCardFaces()
        
        card?.simplePrint()
        //let front = faces![0]
        //let back = faces![1]
        //front.simplePrint()
        //back.simplePrint()
        XCTAssertTrue((faces != nil))
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
}
