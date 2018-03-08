import Foundation

public class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"
    
    public struct RulingList: Codable, CustomStringConvertible{
        public let data: [Ruling]
        
        public var description: String {
            var text = ""
            for rule in data {
                text += rule.description
                text += "\n"
            }
            return text
        }
    }
    
    public struct Ruling: Codable, CustomStringConvertible {
        //     A computer-readable string indicating which company produced this ruling, either wotc or scryfall.
        public let source: String

        // The date when the ruling or note was published.
        public let published_at: String
        
        // The text of the ruling.
        public let comment: String
        
        // A simple print function for a ruling
        public var description: String {
            return "Source: \(source)\nComments: \(comment)\n"
        }
    }
    
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
        public let scryfall_uri: String
        
        // A Scryfall API URI that you can request to begin paginating over the cards in this set.
        public let search_uri: String
        
        // the release date of the set
        public let released_at: String?
        
        // A computer-readable classification for this set. See below.
        public let set_type: String
        
        // The number of cards in this set.
        public let card_count: Int
        
        // Bool for if the card is digital
        public let digital: Bool
        
        // Bool for if the card is foil
        public let foil: Bool
        
        // Block code, like self.code but the for the block the set is a member of
        public let block_code: String?
        
        // The block or group name code for this set, if any.
        public let block: String?
        
        //A URI to an SVG file for this set’s icon on Scryfall’s CDN. Hotlinking this image isn’t recommended, because it may change slightly over time. You should download it and use it locally for your particular user interface needs.
        public let icon_svg_uri: String?
        
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
            text += "Number of Cards: \(self.card_count)\n"
            if self.released_at != nil {
                text += "Release Date: \(self.released_at!)\n"
            }
            text += "Set Type: \(set_type)\n"
            
            return text
        }                   
    }
    
    public struct Card: Codable, CustomStringConvertible {
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
            
            public let mana_cost: String?
            
            public let type_line: String?
            
            public let oracle_text: String?
            
            public let colors: [String]?
            
            public let power: String?
            
            public let toughness: String?
            
            public let loyalty: String?
            
            public let flavor_text: String?
            
            public let illustration_id: String?

            public let image_uris: [String: String]?
            
            public var description: String{
                var text = ""
                // Each variable is tested to see if printing it makes sense.
                text += "Name: \(name!)\n"
                
                if self.mana_cost != nil {
                    text += "Cost: \(mana_cost!)\n"
                }
                if self.type_line != nil {
                    text += "Type Line: \(type_line!)\n"
                }
                if self.oracle_text != nil {
                    text += "Oracle Text:\n\(oracle_text!)\n"
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
        
        // A unique ID for this card in Scryfall’s database.
        public let id: String
        
        // A unique ID for this card’s oracle identity. This value is consistent across reprinted card editions, and unique among different cards with the same name (tokens, Unstable variants, etc).
        public let oracle_id: String
        
        // This card’s multiverse IDs on Gatherer, if any, as an array of integers. Note that Scryfall includes many promo cards, tokens, and other esoteric objects that do not have these identifiers.
        public let multiverse_ids: [Int]
        
        // This card’s Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgo_id: Int?
        
        // This card’s foil Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgo_foil_id: Int?
        
        // The name of this card. If this card has multiple faces, this field will contain both names separated by ␣//␣.
        public let name: String?
        
        // A link to this card object on Scryfall’s API.
        public let uri: String?
        
        // A link to this card’s permapage on Scryfall’s website.
        public let scryfall_uri: String
        
        // If the card has multiple face this is an array of the card faces
        public let card_faces: [Face]?
        
        // A link to where you can begin paginating all re/prints for this card on Scryfall’s API.
        public let prints_search_uri: String
        
        // A link to this card’s rulings on Scryfall’s API.
        public let rulings_uri: String
        
        // A computer-readable designation for this card’s layout. See the layout article.
        public let layout: String
        
        // The card’s converted mana cost. Note that some funny cards have fractional mana costs.
        public let cmc: Double?

        // The type line of this card.
        public let type_line: String?
        
        // The Oracle text for this card, if any.
        public let oracle_text: String?
       
        // The mana cost for this card. This value will be any empty string "" if the cost is absent. Remember that per the game rules, a missing mana cost and a mana cost of {0} are different values.
        public let mana_cost: String?
        
        // This card’s power, if any. Note that some cards have powers that are not numeric, such as *.
        public let power: String?
        
        // This card’s toughness, if any. Note that some cards have toughnesses that are not numeric, such as *.
        public let toughness: String?
       
        // This loyalty if any. Note that some cards have loyalties that are not numeric, such as X.
        public let loyalty: String?
        
        // This card’s colors.
        public let colors: [String]?
        
        // Online listings for these cards names.
        public let purchase_uris: [String:String]
    
        // Flavor text on the card, if there is any
        public let flavor_text: String?
        
        // id of the illustration
        public let illustration_id: String?
        
        // uris of the images
        public let image_uris: [String:String]?
        
        // legality in different formats
        public let legalities: [String:String]
        
        // is or is not on the reserved list
        public let reserved: Bool
        
        // This card’s overall rank/popularity on EDHREC. Not all carsd are ranked.
        public let edhrec_rank: Int?
        
        // If this card is closely related to other cards, this property will be an array with.
        public let all_parts: [RelatedCard]?
        
        // This card's set code
        public let set: String
        
        // This card's set's full name
        public let set_name: String
        
        // This card's rarity. This is not the same for all versions of the card.
        public let rarity: String
        
        // This card's artist
        public let artist: String?
        
        // True if this is a digital card on Magic Online.
        public let digital: Bool
        
        // True if this card’s imagery is high resolution.
        public let highres_image: Bool
        
        // True if this card’s artwork is larger than normal.
        public let full_art: Bool
        
        // This card’s watermark, if any.
        public let watermark: String?
        
        // True if this card is timeshifted.
        public let timeshifted: Bool
        
        // True if this card is colorshifted.
        public let colorshifted: Bool
        
        // True if card is from the future
        public let futureshifted: Bool
        
        // This card’s border color: black, borderless, gold, silver, or white.
        public let border_color: String
        
        // This card’s story spotlight number, if any.
        public let story_spotlight_number: Int?
        
        // A URL to this cards’s story article, if any.
        public let story_spotlight_uri: String?
        
        // Cost of the card in USD
        public let usd: String?
        
        // Cost of the card in tickets
        public let tix: String?
        
        // Cost of the card in euros
        public let eur: String?
        
        // return string when self is used as a parameter for print
        public var description: String{
            var text = ""
            // if the card has multiple faces, print them
            if (self.card_faces) != nil {
                for face in card_faces! {
                    text += face.description
                    text += "\n"
                }
                return text
            }
            // Each variable is tested to see if printing it makes sense.
            if self.name != nil {
                text += "Name: \(name!)\n"
            }
            if self.mana_cost != nil {
                text += "Cost: \(mana_cost!)\n"
            }
            if self.type_line != nil {
                text += "Type Line: \(type_line!)\n"
            }
            if self.oracle_text != nil {
                text += "Oracle Text:\n\(oracle_text!)\n"
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
    static func parseResource<ResultType: Decodable>(call:String, completion: @escaping (Result<ResultType>) -> ()) {
        
        let url = URL(string: "\(scryfall)\(call)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard let content = data else {
                print("Error: There was no data returned from JSON file.")
                return
            }
            
            let decoder = JSONDecoder()
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
                //print("Error: \(error)")
                completion(.failure(error))
            }
            
            //print("\(String(data: content,encoding: .utf8))")
        }
        task.resume()
    }
    
    // gets a Card by using the code and id number
    public static func getCard(code: String, number: Int) throws -> Card
    {
        let call = "cards/\(code)/\(number)"
        var card: Result<Card>?
        var stop = false
        parseResource(call: call){
            (newcard: Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return try card!.promote()
    }
    
    // fuzzy
    public static func getCard(fuzzy: String) throws -> Card
    {
        let encodeFuzz = fuzzy.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?fuzzy=\(encodeFuzz)"
        

        var card: Result<Card>?
        var stop = false
        parseResource(call: call){
            (newcard:Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            // Do this until parseCard is done
        }
        
        return try card!.promote()
    }
    
    
    // exact
    public static func getCard(exact: String) throws -> Card
    {
        let encodeExactly = exact.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?exact=\(encodeExactly)"
        
        var card: Result<Card>?
        var stop = false
        parseResource(call: call){
            (newcard: Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return try card!.promote()
    }
    
    // fuzzy
    public static func getRandomCard() throws -> Card
    {
        let call = "cards/random"
        
        var card: Result<Card>?
        var stop = false
        parseResource(call: call){
            (newcard: Result<Card>) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            // Do this until parseCard is done
        }
        
        return try card!.promote()
    }
    
    
    // set
    public static func getSet(code: String) throws -> ScryfallSet
    {
        let encodeExactly = code.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "sets/\(encodeExactly)"
        
        var set: Result<ScryfallSet>?
        var stop = false
        parseResource(call: call){
            (newset: Result<ScryfallSet>) in
            set = newset
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return try set!.promote()
    }
    
    
    public static func getSetList() throws -> SetList
    {
        let call = "sets/"
        
        var setlist: Result<SetList>?
        var stop = false
        parseResource(call: call){
            (newsetlist: Result<SetList>) in
            setlist = newsetlist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return try setlist!.promote()
    }
    
    
    public static func getCardList() throws -> CardList
    {
        let call = "cards/"
        
        var cardlist: Result<CardList>?
        var stop = false
        parseResource(call: call){
            (newcardlist: Result<CardList>) in
            cardlist = newcardlist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return try cardlist!.promote()
    }
    
    public static func getCardList(page:Int) throws -> CardList
    {
        let call = "cards?page=\(page)"
        
        var cardlist: Result<CardList>?
        var stop = false
        parseResource(call: call){
            (newcardlist: Result<CardList>) in
            cardlist = newcardlist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return try cardlist!.promote()
    }
    
    
    public static func getRulingList(code:String,number:Int) throws -> RulingList
    {
        let call = "cards/\(code)/\(number)/rulings"
        
        var rulelist: Result<RulingList>?
        var stop = false
        parseResource(call: call){
            (newrulelist: Result<RulingList>) in
            rulelist = newrulelist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return try rulelist!.promote()
        
    }
}

