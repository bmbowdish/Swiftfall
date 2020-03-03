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
    
    func testSymbols() throws {
        do {
            let syms = try Swiftfall.getSymbols()
            _ = syms.data[1]
        } catch {
            print(error)
            XCTFail("\(error)")
        }
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
    
    func testSetFoil() throws {
        do {
            print(try Swiftfall.getSet(code: "KTK").foilOnly)
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
            _ = card.cardFaces
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
            _ = try Swiftfall.getCard(exact: "Sensei's Divining Top").edhrecRank
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
    
    func testErrorWarning() throws {
        do {
            _ = try Swiftfall.getCatalog(catalog: "types")
        } catch {
            print(error)
        }
    }
    
    func testAutocomplete() throws {
        do {
            _ = try Swiftfall.autocomplete("Thal")
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testCatalog() throws {
        do {
            _ = try Swiftfall.getCatalog(catalog: "land-types").totalValues
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testCardNames() throws {
        do {
            _ = try Swiftfall.cardNames()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testWordBank() throws {
        do {
            _ = try Swiftfall.wordBank()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testCreatureTypes() throws {
        do {
            _ = try Swiftfall.creatureTypes()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testPlaneswalkerTypes() throws {
        do {
            _ = try Swiftfall.planeswalkerTypes()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testLandTypes() throws {
        do {
            _ = try Swiftfall.landTypes()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testSpellTypes() throws {
        do {
            _ = try Swiftfall.spellTypes()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testArtifactTypes() throws {
        do {
            _ = try Swiftfall.artifactTypes()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testPowers() throws {
        do {
            _ = try Swiftfall.powers()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testToughnesses() throws {
        do {
            _ = try Swiftfall.toughnesses()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testLoyalties() throws {
        do {
            _ = try Swiftfall.loyalties()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testWatermarks() throws {
        do {
            _ = try Swiftfall.watermarks()
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testArenaCode() throws {
        do {
            _ = try Swiftfall.getCard(arena: 67330)
        } catch {
            print(error)
            XCTFail()
        }
    }
    
    func testPrices() throws {
        do {
            let _ = try Swiftfall.getCard(fuzzy: "Brainstorm")
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
