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
    
    func testRulingList() throws {
        do {
            let rulings = try Swiftfall.getRulingList(code: "ima", number: 65)
            // print(rulings)
            _ = rulings.data[1]
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func testRandomCard() throws {
        do {
            _ = try Swiftfall.getRandomCard()
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func testFuzzySpellSimpleSingleWord() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let fuzzy = "Shock"
        let card = try Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssertTrue(nil != card.name)
    }
    
    func testFuzzySpellSimpleMultiWord() throws {
        let fuzzy = "Fatal Push"
        let card = try Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssertTrue(nil != card.name)
    }
    
    func testFuzzySpellApostrophe() throws {
        let fuzzy = "Gaea's Blessing"
        let card = try Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssertTrue(nil != card.name)
    }
    
    func testExactSpellSimpleSingleWord() throws {
        let exact = "Shock"
        let card = try Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssertTrue(exact == card.name)
    }
    
    func testExactSpellSimpleMultiWord() throws {
        let exact = "Fatal Push"
        let card = try Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssertTrue(exact == card.name)
    }
    
    func testExactSpellApostrophe() throws {
        let exact = "Gaea's Blessing"
        let card = try Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssertTrue(exact == card.name)
    }
    
    func testFuzzyCreatureSimpleSingleWordStringPowerStringTough() throws {
        let fuzzy = "Tarmogoyf"
        let card = try Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssert((card.power != nil))
    }
    
    func testFuzzyCreatureSimpleSingleWord() throws {
        let fuzzy = "Triskelion"
        let card = try Swiftfall.getCard(fuzzy: fuzzy)
        //card?.simplePrint()
        XCTAssert((card.power != nil))
    }
    
    func testExactCreatureApostrophe() throws {
        let exact = "Abu Ja'far"
        let card = try Swiftfall.getCard(exact: exact)
        //card?.simplePrint()
        XCTAssert(card.power != nil)
    }
    
    func testExactNotMTGO() throws {
        do {
            _ = try Swiftfall.getCard(exact: "Flash")
        } catch {
            XCTFail()
        }

    }
    
    func testVeryFuzzy() throws {
        do {
            _ = try Swiftfall.getCard(fuzzy: "austere")
        } catch {
            XCTFail()
        }
    }
    
    func testExactVsFuzzy() throws {
        let exact = "Austere Command"
        let fuzzy = "Aust Com"
        let cardF = try Swiftfall.getCard(fuzzy: fuzzy)
        let cardE = try Swiftfall.getCard(exact: exact)
        XCTAssertTrue(cardF.name == cardE.name)
    }
    
    func testPurchaseURI() throws {
        let fuzzy = "Black Lotus"
        let card = try Swiftfall.getCard(fuzzy: fuzzy)
        //cardF?.simplePrint()
        XCTAssertTrue(card.purchase_uris["ebay"] != nil)
    }
    
    func testSetCode() throws {
        do {
            _ = try Swiftfall.getSet(code: "KTK")
        } catch {
            XCTFail()
        }
    }
    
    func testSetCodeNoBlock() throws {
        do {
            _ = try Swiftfall.getSet(code: "EMA")
        } catch {
            XCTFail()
        }
    }
    
    func testSetList() throws {
        do {
            _ = try Swiftfall.getSetList()
        } catch {
            XCTFail()
        }
    }
    
    func testCardList() throws {
        do {
            _ = try Swiftfall.getCardList()
        } catch {
            XCTFail()
        }
    }
    
    func testCardListPageNumber() throws {
        do {
            _ = try Swiftfall.getCardList(page:2)
        } catch {
            XCTFail()
        }
    }
    
    func testPlaneswalker() throws {
        do {
            _ = try Swiftfall.getCard(exact: "Jace Beleren")
        } catch {
            XCTFail()
        }
    }
    
    func testImageURIs() throws {
        let card = try Swiftfall.getRandomCard()
        XCTAssert(card.image_uris != nil)
    }
    
    func testDoubleFaced() throws {
        let card = try Swiftfall.getCard(fuzzy: "Jace Vryn's Prodigy")
        let faces = card.card_faces
        XCTAssertTrue((faces != nil))
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
}
