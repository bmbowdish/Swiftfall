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
            _ = rulings.data[1]
        } catch {
            print(error)
            XCTFail("\(error)")
        }
    }
    
    func testRandomCard() throws {
        do {
            _ = try Swiftfall.getRandomCard()
        } catch {
            print(error)
            XCTFail("\(error)")
        }
    }
    
    func testGetCardCodeNumber() throws {
        do {
            _ = try Swiftfall.getCard(code: "xln", number: 96)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testFractionalManaCost() throws {
        do {
            _ = try Swiftfall.getCard(exact: "Little Girl")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testCatalog() throws {
        do {
            _ = try Swiftfall.getCatalog(catalog: "land-types")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testFuzzySpellSimpleSingleWord() throws {
        do {
            _ = try Swiftfall.getCard(fuzzy: "Shock")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testFuzzySpellSimpleMultiWord() throws {
        do {
            _ = try Swiftfall.getCard(fuzzy: "Fatal Push")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testFuzzySpellApostrophe() throws {
        do {
            _ = try Swiftfall.getCard(fuzzy: "Gaea's Blessing")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testExactSpellSimpleSingleWord() throws {
        do {
        _ = try Swiftfall.getCard(exact: "Shock")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testExactSpellSimpleMultiWord() throws {
        do {
            let exact = "Fatal Push"
            _ = try Swiftfall.getCard(exact: exact)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testExactSpellApostrophe() throws {
        do {
            _ = try Swiftfall.getCard(exact: "Gaea's Blessing")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testFuzzyCreatureSimpleSingleWordStringPowerStringTough() throws {
        do {
            _ = try Swiftfall.getCard(fuzzy: "Tarmogoyf")
        } catch {
            print(error)
            XCTFail()
        }
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
            print(error)
            XCTFail()
        }

    }
    
    func testVeryFuzzy() throws {
        do {
            _ = try Swiftfall.getCard(fuzzy: "austere")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testExactVsFuzzy() throws {
        do {
            let exact = "Austere Command"
            let fuzzy = "Aust Com"
            let cardF = try Swiftfall.getCard(fuzzy: fuzzy)
            let cardE = try Swiftfall.getCard(exact: exact)
            if(!(cardF.name == cardE.name)){
                XCTFail()
            }
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testPurchaseURI() throws {
        do {
            let fuzzy = "Black Lotus"
            _ = try Swiftfall.getCard(fuzzy: fuzzy)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testSetCode() throws {
        do {
            _ = try Swiftfall.getSet(code: "KTK")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testSetCodeNoBlock() throws {
        do {
            _ = try Swiftfall.getSet(code: "EMA")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testSetList() throws {
        do {
            _ = try Swiftfall.getSetList()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testCardList() throws {
        do {
            _ = try Swiftfall.getCardList()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testCardListPageNumber() throws {
        do {
            _ = try Swiftfall.getCardList(page:2)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testPlaneswalker() throws {
        do {
            _ = try Swiftfall.getCard(exact: "Jace Beleren")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testImageURIs() throws {
        do {
            _ = try Swiftfall.getRandomCard()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testDoubleFaced() throws {
        do {
            let card = try Swiftfall.getCard(fuzzy: "Jace Vryn's Prodigy")
            _ = card.card_faces
        } catch {
            print(error)
            XCTFail()
        }
    }

    func testLegalities() throws {
        do {
            let card = try Swiftfall.getCard(exact: "Black Lotus")
            _ = card.legalities
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testEDHRECRank() throws {
        do {
            _ = try Swiftfall.getCard(exact: "Sensei's Divining Top").edhrec_rank
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testReserved() throws {
        do {
            _ = try Swiftfall.getCard(exact: "Black Lotus").reserved
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

}
