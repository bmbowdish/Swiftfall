import Foundation

public class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"
    
    public struct Symbol: Codable, CustomStringConvertible {
        
        // The plaintext symbol. Often surrounded with curly braces {}. Note that not all symbols are ASCII text (for example, {∞}).
        public let symbol: String
        
        // An alternate version of this symbol, if it is possible to write it without curly braces.
        public let looseVariant: String?
        
        // An English snippet that describes this symbol. Appropriate for use in alt text or other accessible communication formats.
        public let english: String
        
        // True if it is possible to write this symbol “backwards”. For example, the official symbol {U/P} is sometimes written as {P/U} or {P\U} in informal settings. Note that the Scryfall API never writes symbols backwards in other responses. This field is provided for informational purposes.
        public let transposable: Bool
        
        // True if this is a mana symbol.
        public let representsMana: Bool?
        
        // True if this symbol appears in a mana cost on any Magic card. For example {20} has this field set to false because {20} only appears in Oracle text, not mana costs.
        public let appearsInManaCosts: Bool
        
        // A decimal number representing this symbol’s converted mana cost. Note that mana symbols from funny sets can have fractional converted mana costs.
        public let cmc: Double?
        
        // True if this symbol is only used on funny cards or Un-cards.
        public let funny: Bool
        
        // An array of colors that this symbol represents.
        public let colors: [String]
        
        // String that is printed when print(self) is called.
        public var description: String {
            return "Symbol: \(symbol)\nEnglish: \(english)\n"
        }
    }
    
    public struct SymbolList: Codable, CustomStringConvertible {
        
        // if there are more pages, should always be false
        public let hasMore: Bool
        
        // the symbols
        public let data: [Symbol]

        public var description: String {
            var text = ""
            for sym in data {
                text += sym.description
                text += "\n"
            }
            return text
        }
    }
    
    public struct RulingList: Codable, CustomStringConvertible {
        // Contains rulings
        public let data: [Ruling]
        
        public let hasMore: Bool
        
        public var description: String {
            var text = ""
            for rule in data {
                text += rule.description
                text += "\n"
            }
            return text
        }
    }
    
    // A Catalog object contains an array of Magic datapoints (words, card values, etc). Catalog objects are provided by the API as aids for building other Magic software and understanding possible values for a field on Card objects.
    public struct Catalog: Codable, CustomStringConvertible {
        public let uri: String?
        public let totalValues: Int?
        public let totalItems: Int?
        public let data:[String]
        
        public var description: String {
            var text = ""
            for thing in data {
                text += "\(thing)\n"
            }
            return text
        }
    }
    
    public struct Ruling: Codable, CustomStringConvertible {
        //     A computer-readable string indicating which company produced this ruling, either wotc or scryfall.
        public let source: String

        // The date when the ruling or note was published.
        public let publishedAt: String
        
        // The text of the ruling.
        public let comment: String
        
        // A simple print function for a ruling
        public var description: String {
            return "Source: \(source)\nComments: \(comment)\n"
        }
    }
    
    // Sometimes we will cause and error and the API will tell us what it is.
    struct ScryfallError: Codable, Error, CustomStringConvertible {
        
        let code: String
        let type: String
        let status: Int
        let details: String
        
        public var description: String {
            return "Error: \(code)\nDetails: \(details)\n"
        }
    }
    
    // struct which contains all sets
    public struct SetList: Codable, CustomStringConvertible {
        // data is an array of Sets
        public let data: [ScryfallSet]
        
        public let hasMore: Bool
        
        // prints each set
        public var description: String {
            var text = ""
            var i = 0
            for set in data {
                text += "Set Number: \(i)\n"
                text += set.description
                text += "\n"
                i = i + 1
            }
            return text
        }
    }
    
    // struct which contrains a list of cards
    public struct CardList: Codable, CustomStringConvertible {
        // an array of Cards
        public let data: [Card]
        
        public let hasMore: Bool
        
        // prints each set
        public var description: String {
            var text = ""
            var i = 0
            for card in data {
                text += "Card Number: \(i)\n"
                text += card.description
                text += "\n"
                i = i + 1
            }
            return text
        }
    }
    
    // A Magic set is how cards are released in reality.
    // It contains no cards in Swiftfall or Scryfall.
    public struct ScryfallSet: Codable, CustomStringConvertible {
        
        // The unique three or four-letter code for this set.
        public let code: String?
        
        // The unique code for this set on MTGO, which may differ from the regular code.
        public let mtgo: String?
        
        //The English name of the set.
        public let name: String
        
        //
        public let uri: String
        
        // Scryfall API URI 
        public let scryfallUri: String
        
        // A Scryfall API URI that you can request to begin paginating over the cards in this set.
        public let searchUri: String
        
        // the release date of the set
        public let releasedAt: String?
        
        // A computer-readable classification for this set. See below.
        public let setType: String
        
        // The number of cards in this set.
        public let cardCount: Int
        
        // Bool for if the card is digital
        public let digital: Bool
        
        // Bool for if the card is foil
        public let foilOnly: Bool
        
        // Block code, like self.code but the for the block the set is a member of
        public let blockCode: String?
        
        // The block or group name code for this set, if any.
        public let block: String?
        
        //A URI to an SVG file for this set’s icon on Scryfall’s CDN. Hotlinking this image isn’t recommended, because it may change slightly over time. You should download it and use it locally for your particular user interface needs.
        public let iconSvgUri: String?
        
        // prints the minimal data for the set
        public var description: String{
            var text = ""
            text += "Name: \(name)\n"
            if self.code != nil {
                text += "Code: \(self.code!)\n"
            }
            if self.block != nil {
                text += "Block: \(self.block!)\n"
            }
            text += "Number of Cards: \(self.cardCount)\n"
            if self.releasedAt != nil {
                text += "Release Date: \(self.releasedAt!)\n"
            }
            text += "Set Type: \(setType)\n"
            
            return text
        }                   
    }
    
    public struct Card: Codable, CustomStringConvertible {
        
        // Some cards have cards closely related to them. They will contain an array of RelatedCards.
        public struct RelatedCard: Codable, CustomStringConvertible {
            
            // An unique ID for this card in Scryfall’s database.
            let id: String
            
            // The name of this particular related card.
            let name: String
            
            // A URI where you can retrieve a full object describing this card on Scryfall’s API.
            let uri: String
            
            public var description: String {
                return "Name: \(name)\nURI: \(uri)"
            }
        }
        
        public struct Face: Codable, CustomStringConvertible {
            
            // All of these variables are the same as a normal card.
            
            public let name: String?
            
            public let manaCost: String?
            
            public let typeLine: String?
            
            public let oracleText: String?
            
            public let colors: [String]?
            
            public let power: String?
            
            public let toughness: String?
            
            public let loyalty: String?
            
            public let flavorText: String?
            
            public let illustrationId: String?

            public let imageUris: [String: String]?
            
            public var description: String {
                var text = ""
                // Each variable is tested to see if printing it makes sense.
                text += "Name: \(name!)\n"
                
                if self.manaCost != nil {
                    text += "Cost: \(manaCost!)\n"
                }
                if self.typeLine != nil {
                    text += "Type Line: \(typeLine!)\n"
                }
                if self.oracleText != nil {
                    text += "Oracle Text:\n\(oracleText!)\n"
                }
                if self.power != nil && self.toughness != nil {
                    text += "Power: \(power!)\nToughness: \(toughness!)\n"
                }
                if self.loyalty != nil {
                    text += "Loyalty: \(loyalty!)\n"
                }
                return text
            }
        }
        
        public struct Prices: Codable, CustomStringConvertible {
            
            public let usd: String?
            
            public let usdFoil: String?
          
            public let eur: String?

            public let tix: String?

            public var description: String {
                var text = ""
                if self.usd != nil {
                    text += "usd: \(usd)"
                }
                if self.usdFoil != nil {
                    text += "usd foil: \(usdFoil)"
                }
                if self.eur != nil {
                    text += "usd: \(eur)"
                }
                if self.tix != nil {
                    text += "usd: \(tix)"
                }
                return text
            }
            
        }
        
        public let prices: Prices?
        
        // A unique ID for this card in Scryfall’s database.
        public let id: String
        
        // A unique ID for this card’s oracle identity. This value is consistent across reprinted card editions, and unique among different cards with the same name (tokens, Unstable variants, etc).
        public let oracleId: String
        
        // This card’s multiverse IDs on Gatherer, if any, as an array of integers. Note that Scryfall includes many promo cards, tokens, and other esoteric objects that do not have these identifiers.
        public let multiverseIds: [Int]
        
        // This card’s Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgoId: Int?
        
        // This card’s foil Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgoFoilId: Int?
        
        // The name of this card. If this card has multiple faces, this field will contain both names separated by ␣//␣.
        public let name: String?
        
        // A link to this card object on Scryfall’s API.
        public let uri: String?
        
        // A link to this card’s permapage on Scryfall’s website.
        public let scryfallUri: String
        
        // If the card has multiple face this is an array of the card faces
        public let cardFaces: [Face]?
        
        // A link to where you can begin paginating all re/prints for this card on Scryfall’s API.
        public let printsSearchUri: String
        
        // A link to this card’s rulings on Scryfall’s API.
        public let rulingsUri: String
        
        // A computer-readable designation for this card’s layout. See the layout article.
        public let layout: String
        
        // The card’s converted mana cost. Note that some funny cards have fractional mana costs.
        public let cmc: Double?

        // The type line of this card.
        public let typeLine: String?
        
        // The Oracle text for this card, if any.
        public let oracleText: String?
       
        // The mana cost for this card. This value will be any empty string "" if the cost is absent. Remember that per the game rules, a missing mana cost and a mana cost of {0} are different values.
        public let manaCost: String?
        
        // This card’s power, if any. Note that some cards have powers that are not numeric, such as *.
        public let power: String?
        
        // This card’s toughness, if any. Note that some cards have toughnesses that are not numeric, such as *.
        public let toughness: String?
       
        // This loyalty if any. Note that some cards have loyalties that are not numeric, such as X.
        public let loyalty: String?
        
        // This card’s colors.
        public let colors: [String]?
        
        // Online listings for these cards names.
        public let purchaseUris: [String:String]
    
        // Flavor text on the card, if there is any
        public let flavorText: String?
        
        // id of the illustration
        public let illustrationId: String?
        
        // uris of the images
        public let imageUris: [String:String]?
        
        // legality in different formats
        public let legalities: [String:String]
        
        // is or is not on the reserved list
        public let reserved: Bool
        
        // This card’s overall rank/popularity on EDHREC. Not all carsd are ranked.
        public let edhrecRank: Int?
        
        // If this card is closely related to other cards, this property will be an array with.
        public let allParts: [RelatedCard]?
        
        // This card's set code
        public let set: String
        
        // This card's set's full name
        public let setName: String
        
        // This card's rarity. This is not the same for all versions of the card.
        public let rarity: String
        
        // This card's artist
        public let artist: String?
        
        // True if this is a digital card on Magic Online.
        public let digital: Bool
        
        // True if this card’s imagery is high resolution.
        public let highresImage: Bool
        
        // True if this card’s artwork is larger than normal.
        public let fullArt: Bool
        
        // This card’s watermark, if any.
        public let watermark: String?
        
        // This card’s border color: black, borderless, gold, silver, or white.
        public let borderColor: String
        
        // This card’s story spotlight number, if any.
        public let storySpotlightNumber: Int?
        
        // A URL to this cards’s story article, if any.
        public let storySpotlightUri: String?
        
        // return string when self is used as a parameter for print
        public var description: String {
            var text = ""
            // if the card has multiple faces, print them
            if (self.cardFaces) != nil {
                for face in cardFaces! {
                    text += face.description
                    text += "\n"
                }
                return text
            }
            // Each variable is tested to see if printing it makes sense.
            if self.name != nil {
                text += "Name: \(name!)\n"
            }
            if self.manaCost != nil {
                text += "Cost: \(manaCost!)\n"
            }
            if self.typeLine != nil {
                text += "Type Line: \(typeLine!)\n"
            }
            if self.oracleText != nil {
                text += "Oracle Text:\n\(oracleText!)\n"
            }
            if self.power != nil && self.toughness != nil {
                text += "Power: \(power!)\nToughness: \(toughness!)\n"
            }
            if self.loyalty != nil {
                text += "Loyalty: \(loyalty!)\n"
            }
            
            return text
        }
    }
    
    // Result enum to control possible end states
    enum Result<Value> {
        case success(Value)
        case failure(Error)
        func promote() throws -> Value {
            switch self {
            case .success(let value):
                return value
            case .failure(let error):
                throw error
            }
        }
    }
    
    /// Retreives JSON data from URL and parses it with JSON decoder.
    static func parseResource<ResultType: Decodable>(call: String, completion: @escaping (Result<ResultType>) -> ()) {
        
        let url = URL(string: "\(scryfall)\(call)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard let content = data else {
                print("Error: There was no data returned from JSON file.")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let httpStatus = (response as! HTTPURLResponse).statusCode
            do {
                if (200..<300).contains(httpStatus) {
                    // Decode JSON file starting from Response struct.
                    let decoded:ResultType = try decoder.decode(ResultType.self, from: content)
                    completion(.success(decoded))
                } else {
                    let decoded:ScryfallError = try decoder.decode(ScryfallError.self, from: content)
                    completion(.failure(decoded))
                }
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // gets a Card by using the code and id number
    public static func getCard(code: String, number: Int) throws -> Card {
        let call = "cards/\(code)/\(number)"
        var card: Result<Card>?
        var stop = false
        parseResource(call: call){
            (newcard: Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            //Do this until parseResouce is done
        }
        
        return try card!.promote()
    }
    
    // gets a Card by using the arena code
    public static func getCard(arena: Int) throws -> Card {
        let call = "cards/arena/\(arena)"
        var card: Result<Card>?
        var stop = false
        parseResource(call: call){
            (newcard: Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            //Do this until parseResouce is done
        }
        
        return try card!.promote()
    }
    
    // fuzzy
    public static func getCard(fuzzy: String) throws -> Card {
        let encodeFuzz = fuzzy.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?fuzzy=\(encodeFuzz)"
        

        var card: Result<Card>?
        var stop = false
        parseResource(call: call) {
            (newcard:Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop) {
            // Do this until parseResource is done
        }
        
        return try card!.promote()
    }
    
    
    // exact
    public static func getCard(exact: String) throws -> Card {
        let encodeExactly = exact.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?exact=\(encodeExactly)"
        
        var card: Result<Card>?
        var stop = false
        parseResource(call: call) {
            (newcard: Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try card!.promote()
    }
    
    // fuzzy
    public static func getRandomCard() throws -> Card {
        let call = "cards/random"
        
        var card: Result<Card>?
        var stop = false
        parseResource(call: call) {
            (newcard: Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop) {
            // Do this until parseResource is done
        }
        
        return try card!.promote()
    }
    
    // get a catalog
    public static func getCatalog(catalog: String) throws -> Catalog {
        let encodeCatalog = catalog.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "catalog/\(encodeCatalog)"
        var cat: Result<Catalog>?
        var stop = false
        parseResource(call: call) {
            (newcat: Result<Catalog>) in
            cat = newcat
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try cat!.promote()
    }
    
    // set
    public static func getSet(code: String) throws -> ScryfallSet {
        let encodeExactly = code.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "sets/\(encodeExactly)"
        
        var set: Result<ScryfallSet>?
        var stop = false
        parseResource(call: call) {
            (newset: Result<ScryfallSet>) in
            set = newset
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try set!.promote()
    }
    
    
    public static func getSetList() throws -> SetList
    {
        let call = "sets/"
        
        var setlist: Result<SetList>?
        var stop = false
        parseResource(call: call) {
            (newsetlist: Result<SetList>) in
            setlist = newsetlist
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try setlist!.promote()
    }
    
    
    public static func getCardList() throws -> CardList {
        let call = "cards/"
        
        var cardlist: Result<CardList>?
        var stop = false
        parseResource(call: call) {
            (newcardlist: Result<CardList>) in
            cardlist = newcardlist
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try cardlist!.promote()
    }
    
    public static func getCardList(page:Int) throws -> CardList
    {
        let call = "cards?page=\(page)"
        
        var cardlist: Result<CardList>?
        var stop = false
        parseResource(call: call) {
            (newcardlist: Result<CardList>) in
            cardlist = newcardlist
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try cardlist!.promote()
    }
    
    
    public static func getRulingList(code:String,number:Int) throws -> RulingList {
        let call = "cards/\(code)/\(number)/rulings"
        
        var rulelist: Result<RulingList>?
        var stop = false
        parseResource(call: call) {
            (newrulelist: Result<RulingList>) in
            rulelist = newrulelist
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try rulelist!.promote()
        
    }
    
    public static func getSymbols() throws -> SymbolList {
        let call = "symbology"
        
        var symbollist: Result<SymbolList>?
        var stop = false
        parseResource(call: call) {
            (newsym: Result<SymbolList>) in
            symbollist = newsym
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try symbollist!.promote()
    }
    
    // give a search term and return a catalog of similar cards
    public static func autocomplete(_ string: String) throws -> Catalog {
        let call = "cards/autocomplete?q=\(string)"
        
        var cat: Result<Catalog>?
        var stop = false
        parseResource(call: call) {
            (newcat: Result<Catalog>) in
            cat = newcat
            stop = true
        }
        
        while(!stop) {
            //Do this until parseResource is done
        }
        
        return try cat!.promote()
    }
    
    // prints a list of all catalogs for the user
    public static func catalogs() {
        print("There are 11 catalogs.\n* card-names\n* word-bank\n* creature-types\n* planeswalker-types\n* land-types\n* spell-types\n* artifact-types\n* powers\n* toughnesses\n* loyalties\n* watermarks")
    }
    
    public static func cardNames() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "card-names")
    }
    
    public static func wordBank() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "word-bank")
    }
    
    public static func creatureTypes() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "creature-types")
    }
    
    public static func planeswalkerTypes() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "planeswalker-types")
    }
    
    public static func landTypes() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "land-types")
    }
    
    public static func spellTypes() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "spell-types")
    }
    
    public static func artifactTypes() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "artifact-types")
    }
    
    public static func powers() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "powers")
    }
    
    public static func toughnesses() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "toughnesses")
    }
    
    public static func loyalties() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "loyalties")
    }
    
    public static func watermarks() throws -> Catalog {
        return try Swiftfall.getCatalog(catalog: "watermarks")
    }
}

