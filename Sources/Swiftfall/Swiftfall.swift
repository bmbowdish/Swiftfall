import Foundation

public class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"
    
    public struct RulingList: Codable {
        public let data:[Ruling?]
        
        public func simplePrint() {
            for rule in data {
                rule?.simplePrint()
            }
        }
    }
    
    public struct Ruling: Codable {
        //     A computer-readable string indicating which company produced this ruling, either wotc or scryfall.
        public let source: String

        // The date when the ruling or note was published.
        public let published_at: String
        
        // The text of the ruling.
        public let comment: String
        
        // A simple print function for a ruling
        public func simplePrint() {
            print("Source: \(source)\nComments: \(comment)\n")
        }
    }
    
    struct Error: Codable{
        let code: String
        let type: String
        let status: Int
        let details: String
        
        public func simplePrint(){
            print("Details:\(details)\n")
        }
    }
    
    // struct which contains all sets
    public struct SetList: Codable {
        // data is an array of Sets
        public let data: [Set?]
        
        // prints each set using their simplePrint()
        public func simplePrint(){
            var i = 0
            for set in data {
                if let t_set = set{
                    print("Set Number: \(i)")
                    t_set.simplePrint()
                    i = i + 1
                }
            }
        }
    }
    
    // struct which contrains a list of cards
    public struct CardList: Codable {
        // an array of Cards
        public let data: [Card?]
        
        // prints each Card using their simplePrint()
        public func simplePrint(){
            var i = 0
            for card in data {
                if let t_card = card{
                    print("\nCard Number: \(i)\n")
                    t_card.simplePrint()
                    i = i + 1
                }
            }
        }
    }
    
    // A Magic set is how cards are released in reality.
    // It contains no cards in Swiftfall or Scryfall.
    public struct Set: Codable {
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
        public func simplePrint(){
            print("Name: \(name)")
            if self.code != nil {
                print("Code: \(self.code!)")
            }
            if self.block != nil {
                print("Block: \(self.block!)")
            }
            print("Number of Cards: \(self.card_count)")
            if self.released_at != nil {
                print("Release Date: \(self.released_at!)")
            }
            print("Set Type: \(set_type)\n")
        }                   
    }
    public struct Card:Codable {
        
        public struct CardFace: Codable {
            
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

            public let image_uris:[String:String]?
            
            public func simplePrint(){
                // Each variable is tested to see if printing it makes sense.
                if self.name != nil {
                    print("Name: \(name!)")
                }
                if self.mana_cost != nil {
                    print("Cost: \(mana_cost!)")
                }
                if self.type_line != nil {
                    print("Type Line: \(type_line!)")
                }
                if self.oracle_text != nil {
                    print("Oracle Text:\n\(oracle_text!)")
                }
                if self.power != nil && self.toughness != nil {
                    print("Power: \(power!)\nToughness: \(toughness!)")
                }
                if self.loyalty != nil {
                    print("Loyalty: \(loyalty!)")
                }
            }
        }
        
        // A unique ID for this card in Scryfall’s database.
        public let id:String?
        
        // A unique ID for this card’s oracle identity. This value is consistent across reprinted card editions, and unique among different cards with the same name (tokens, Unstable variants, etc).
        public let oracle_id:String?
        
        // This card’s multiverse IDs on Gatherer, if any, as an array of integers. Note that Scryfall includes many promo cards, tokens, and other esoteric objects that do not have these identifiers.
        public let multiverse_ids:[Int]
        
        // This card’s Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgo_id:Int?
        
        // This card’s foil Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        public let mtgo_foil_id:Int?
        
        // The name of this card. If this card has multiple faces, this field will contain both names separated by ␣//␣.
        public let name:String?
        
        // A link to this card object on Scryfall’s API.
        public let uri:String?
        
        // A link to this card’s permapage on Scryfall’s website.
        public let scryfall_uri:String?
        
        // If the card has multiple face this is an array of the card faces
        public let card_faces: [CardFace]?
        
        // A link to where you can begin paginating all re/prints for this card on Scryfall’s API.
        public let prints_search_uri:String?
        
        // A link to this card’s rulings on Scryfall’s API.
        public let rulings_uri:String?
        
        // A computer-readable designation for this card’s layout. See the layout article.
        public let layout:String?
        
        // The card’s converted mana cost. Note that some funny cards have fractional mana costs.
        public let cmc:Int?

        // The type line of this card.
        public let type_line:String?
        
        // The Oracle text for this card, if any.
        public let oracle_text:String?
       
        // The mana cost for this card. This value will be any empty string "" if the cost is absent. Remember that per the game rules, a missing mana cost and a mana cost of {0} are different values.
        public let mana_cost:String?
        
        // This card’s power, if any. Note that some cards have powers that are not numeric, such as *.
        public let power: String?
        
        // This card’s toughness, if any. Note that some cards have toughnesses that are not numeric, such as *.
        public let toughness: String?
       
        // This loyalty if any. Note that some cards have loyalties that are not numeric, such as X.
        public let loyalty: String?
        
        // This card’s colors.
        public let colors:[String]?
        
        // Online listings for these cards names.
        public let purchase_uris: [String:String]
    
        // Flavor text on the card, if there is any
        public let flavor_text: String?
        
        // id of the illustration
        public let illustration_id: String?
        
        // uris of the images
        public let image_uris:[String:String]?
        
        public func simplePrint(){
            // if the card has multiple faces, print them
            if (self.card_faces) != nil {
                for face in card_faces! {
                    face.simplePrint()
                }
                return
            } 
            
            // Each variable is tested to see if printing it makes sense.
            if self.name != nil {
                print("Name: \(name!)")
            }
            if self.mana_cost != nil {
                print("Cost: \(mana_cost!)")
            }
            if self.type_line != nil {
                print("Type Line: \(type_line!)")
            }
            if self.oracle_text != nil {
                print("Oracle Text:\n\(oracle_text!)")
            }
            if self.power != nil && self.toughness != nil {
                print("Power: \(power!)\nToughness: \(toughness!)")
            }
            if self.loyalty != nil {
                print("Loyalty: \(loyalty!)")
            }
            
        }
    }
    
    // fuzzy
    public static func getCard(fuzzy: String) -> Card?
    {
        let encodeFuzz = fuzzy.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?fuzzy=\(encodeFuzz)"

        var card: Card?
        var stop = false
        parseCard(call: call){
            (newcard:Card?) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            // Do this until parseCard is done
        }
        
        return card
    }
    
    
    // exact
    public static func getCard(exact: String) -> Card?
    {
        let encodeExactly = exact.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?exact=\(encodeExactly)"
        
        var card: Card?
        var stop = false
        parseCard(call: call){
            (newcard:Card?) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return card
    }
    
    // fuzzy
    public static func getRandomCard() -> Card?
    {
        let call = "cards/random"
        
        var card: Card?
        var stop = false
        parseCard(call: call){
            (newcard:Card?) in
            card = newcard
            stop = true
        }
        
        while(!stop){
            // Do this until parseCard is done
        }
        
        return card
    }
    
    /// Retreives JSON data from URL and parses it with JSON decoder. Thanks Mitchell
    static func parseCard(call:String, completion: @escaping (Card?) -> ()) {
        
        let url = URL(string: "\(scryfall)\(call)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard let content = data else {
                print("Error: There was no data returned from JSON file.")
                return
            }
    
            //print("\(String(data: content,encoding: .utf8))")
            
            let decoder = JSONDecoder()
            do {
                // Decode JSON file starting from Response struct.
                let decoded:Card = try decoder.decode(Card.self, from: content)
                completion(decoded)
            }
            catch {
                // Known Issues:
                //  * Too broad of a request (needs handler) 
                //
                // Present an alert if the JSON data cannot be decoded.
                do {
                    let decoded:Error = try decoder.decode(Error.self, from: content)
                    decoded.simplePrint()
                }
                catch {
                    print("Error: \(error)")
                    completion(nil)
                }
                completion(nil)
            }
        }
        task.resume()
    }
    
    // set
    public static func getSet(code: String) -> Set?
    {
        let encodeExactly = code.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "sets/\(encodeExactly)"
        
        var set: Set?
        var stop = false
        parseCard(call: call){
            (newset:Set?) in
            set = newset
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return set
    }
    
    /// Retreives JSON data from URL and parses it with JSON decoder. Thanks Mitchell
    static func parseCard(call:String, completion: @escaping (Set?) -> ()) {
        
        let url = URL(string: "\(scryfall)\(call)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard let content = data else {
                print("Error: There was no data returned from JSON file.")
                return
            }
            
            //print("\(String(data: content,encoding: .utf8))")
            
            let decoder = JSONDecoder()
            do {
                // Decode JSON file starting from Response struct.
                let decoded:Set = try decoder.decode(Set.self, from: content)
                completion(decoded)
            }
            catch {
                // Known Issues:
                //  * Too broad of a request (needs handler)
                //
                // Present an alert if the JSON data cannot be decoded.
                do {
                    let decoded:Error = try decoder.decode(Error.self, from: content)
                    decoded.simplePrint()
                }
                catch {
                    print("Error: \(error)")
                    completion(nil)
                }
                completion(nil)
            }
        }
        task.resume()
    }
    
    public static func getSetList() -> SetList?
    {
        let call = "sets/"
        
        var setlist: SetList?
        var stop = false
        parseSetList(call: call){
            (newsetlist:SetList?) in
            setlist = newsetlist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return setlist
    }
    
    /// Retreives JSON data from URL and parses it with JSON decoder. Thanks Mitchell
    static func parseSetList(call:String, completion: @escaping (SetList?) -> ()) {
        
        let url = URL(string: "\(scryfall)\(call)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            guard let content = data else {
                print("Error: There was no data returned from JSON file.")
                return
            }
            
            //print("\(String(data: content,encoding: .utf8))")
            
            let decoder = JSONDecoder()
            do {
                // Decode JSON file starting from Response struct.
                let decoded:SetList = try decoder.decode(SetList.self, from: content)
                completion(decoded)
            }
            catch {
                do {
                    let decoded:Error = try decoder.decode(Error.self, from: content)
                    decoded.simplePrint()
                }
                catch {
                    print("Error: \(error)")
                    
                    completion(nil)
                }
                completion(nil)
            }
        }
        task.resume()
    }
    
    public static func getCardList() -> CardList?
    {
        let call = "cards/"
        
        var cardlist: CardList?
        var stop = false
        parseCardList(call: call){
            (newcardlist:CardList?) in
            cardlist = newcardlist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return cardlist
    }
    
    public static func getCardList(page:Int) -> CardList?
    {
        let call = "cards?page=\(page)"
        
        var cardlist: CardList?
        var stop = false
        parseCardList(call: call){
            (newcardlist:CardList?) in
            cardlist = newcardlist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return cardlist
    }
    
    /// Retreives JSON data from URL and parses it with JSON decoder. Thanks Mitchell
    static func parseCardList(call:String, completion: @escaping (CardList?) -> ()) {
        
        let url = URL(string: "\(scryfall)\(call)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let content = data else {
                print("Error: There was no data returned from JSON file.")
                return
            }
            
            //print("\(String(data: content,encoding: .utf8))")
            
            let decoder = JSONDecoder()
            do {
                // Decode JSON file starting from Response struct.
                let decoded:CardList = try decoder.decode(CardList.self, from: content)
                completion(decoded)
            }
            catch {
                do {
                    let decoded:Error = try decoder.decode(Error.self, from: content)
                    decoded.simplePrint()
                }
                catch {
                    print("Error: \(error)")
                    
                    completion(nil)
                }
                completion(nil)
            }
        }
        task.resume()
    }
    
    
    public static func getRulingList(code:String,number:Int) -> RulingList?
    {
        let call = "cards/\(code)/\(number)/rulings"
        
        var rulelist: RulingList?
        var stop = false
        parseRulingList(call: call){
            (newrulelist:RulingList?) in
            rulelist = newrulelist
            stop = true
        }
        
        while(!stop){
            //Do this until parseCard is done
        }
        
        return rulelist
    }
    
    
    /// Retreives JSON data from URL and parses it with JSON decoder. Thanks Mitchell
    static func parseRulingList(call:String, completion: @escaping (RulingList?) -> ()) {
        
        let url = URL(string: "\(scryfall)\(call)")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let content = data else {
                print("Error: There was no data returned from JSON file.")
                return
            }
            
            //print("\(String(data: content,encoding: .utf8))")
            
            let decoder = JSONDecoder()
            do {
                // Decode JSON file starting from Response struct.
                let decoded:RulingList = try decoder.decode(RulingList.self, from: content)
                completion(decoded)
            }
            catch {
                do {
                    let decoded:Error = try decoder.decode(Error.self, from: content)
                    decoded.simplePrint()
                }
                catch {
                    print("Error: \(error)")
                    
                    completion(nil)
                }
                completion(nil)
            }
        }
        task.resume()
    }
}

