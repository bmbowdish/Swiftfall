import Foundation

public class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"
    
    public struct RulingList: Codable {
        var data:[Ruling?]
        public func getData() -> [Ruling?] {
            return self.data
        }
        
        public func getData(index:Int) -> Ruling? {
            return self.data[index]
        }
        
        public func simplePrint() {
            for rule in data {
                rule?.simplePrint()
            }
        }
    }
    
    public struct Ruling: Codable {
        //     A computer-readable string indicating which company produced this ruling, either wotc or scryfall.
        var source: String
        public func getSource() -> String {
            return self.source
        }
        
        // The date when the ruling or note was published.
        var published_at: String
        public func getPublishedAt() -> String {
            return self.published_at
        }
        
        // The text of the ruling.
        var comment: String
        public func getComment() -> String {
            return self.comment
        }
        
        // A simple print function for a ruling
        public func simplePrint() {
            print("Source: \(source)\nComments: \(comment)\n")
        }
    }
    
    struct Error: Codable{
        var code: String
        var type: String
        var status: Int
        var details: String
        
        public func simplePrint(){
            print("Details:\(details)\n")
        }
    }
    
    // struct which contains all sets
    public struct SetList: Codable {
        // data is an array of Sets
        var data: [Set?]
        public func getData() -> [Set?]{
            return self.data
        }
        
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
        var data: [Card?]
        public func getData() -> [Card?] {
            return self.data
        }
        
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
        var code: String?
        public func getCode() -> String? {
            return self.code
        }
        
        // The unique code for this set on MTGO, which may differ from the regular code.
        var mtgo: String?
        public func getMTGO() -> String? {
            return self.mtgo
        }
        
        //The English name of the set.
        var name: String
        public func getName() -> String {
            return self.name
        }
        
        //
        var uri: String
        public func getURI() -> String{
            return self.uri
        }
        
        // Scryfall API URI 
        var scryfall_uri: String
        public func getScryfallURI() -> String {
            return self.scryfall_uri
        }
        
        // A Scryfall API URI that you can request to begin paginating over the cards in this set.
        var search_uri: String
        public func getSearchURI() -> String {
            return self.search_uri
        }
        
        // the release date of the set
        var released_at: String?
        public func getReleasedAt() -> String? {
            return self.released_at
        }
        
        // A computer-readable classification for this set. See below.
        var set_type: String
        public func getSetType() -> String {
            return self.set_type
        }
        
        // The number of cards in this set.
        var card_count: Int
        public func getCardCount() -> Int {
            return self.card_count
        }
        
        // Bool for if the card is digital
        var digital: Bool
        public func getDigital() -> Bool {
            return self.digital
        }
        
        // Bool for if the card is foil
        var foil: Bool
        public func getFoil() -> Bool {
            return self.foil
        }
        
        // Block code, like self.code but the for the block the set is a member of
        var block_code: String?
        public func getBlockCode() -> String? {
            return self.block_code
        }
        
        // The block or group name code for this set, if any.
        var block: String?
        public func getBlock() -> String? {
            return self.block
        }
        
        //A URI to an SVG file for this set’s icon on Scryfall’s CDN. Hotlinking this image isn’t recommended, because it may change slightly over time. You should download it and use it locally for your particular user interface needs.
        var icon_svg_uri: String
        public func getIconSVGURI() -> String {
            return self.icon_svg_uri
        }
        
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
        // A unique ID for this card in Scryfall’s database.
        var id:String
        public func getID() -> String {
            return self.id
        }
        
        // A unique ID for this card’s oracle identity. This value is consistent across reprinted card editions, and unique among different cards with the same name (tokens, Unstable variants, etc).
        var oracle_id:String
        public func getOracleID() -> String {
            return self.oracle_id
        }
        
        // This card’s multiverse IDs on Gatherer, if any, as an array of integers. Note that Scryfall includes many promo cards, tokens, and other esoteric objects that do not have these identifiers.
        var multiverse_ids:[Int]
        public func getMultiverseIDs()->[Int]{
            return self.multiverse_ids
        }
        
        // This card’s Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        var mtgo_id:Int?
        public func getmtgoID() -> Int?{
            return self.mtgo_id
        }
        
        // This card’s foil Magic Online ID (also known as the Catalog ID), if any. A large percentage of cards are not available on Magic Online and do not have this ID.
        var mtgo_foil_id:Int?
        public func getmtgofoilID() -> Int?{
            return self.mtgo_foil_id
        }
        
        // The name of this card. If this card has multiple faces, this field will contain both names separated by ␣//␣.
        var name:String?
        public func getName() -> String?{
            return self.name
        }
        
        // A link to this card object on Scryfall’s API.
        var uri:String
        public func getURI() -> String{
            return self.uri
        }
        
        // A link to this card’s permapage on Scryfall’s website.
        var scryfall_uri:String
        public func getScryfallURI() -> String{
            return self.scryfall_uri
        }
        
        // A link to where you can begin paginating all re/prints for this card on Scryfall’s API.
        var prints_search_uri:String
        public func getPrintsSearchURI() -> String {
            return self.prints_search_uri
        }
        
        // A link to this card’s rulings on Scryfall’s API.
        var rulings_uri:String
        public func getRulingsURI() -> String {
            return self.rulings_uri
        }
        
        // A computer-readable designation for this card’s layout. See the layout article.
        var layout:String
        public func getLayout() -> String {
            return self.layout
        }
        
        // The card’s converted mana cost. Note that some funny cards have fractional mana costs.
        var cmc:Int
        public func getCMC() -> Int {
            return self.cmc
        }
        
        // The type line of this card.
        var type_line:String?
        public func getTypeLine() -> String? {
            return self.type_line
        }
        
        // The Oracle text for this card, if any.
        var oracle_text:String?
        public func getOracleText() -> String? {
            return self.oracle_text
        }
        
        // The mana cost for this card. This value will be any empty string "" if the cost is absent. Remember that per the game rules, a missing mana cost and a mana cost of {0} are different values.
        var mana_cost:String?
        public func getManaCost() -> String? {
            return self.mana_cost
        }
        
        // This card’s power, if any. Note that some cards have powers that are not numeric, such as *.
        var power: String?
        public func getPower() -> String? {
            return self.power
        }
        
        // This card’s toughness, if any. Note that some cards have toughnesses that are not numeric, such as *.
        var toughness: String?
        public func getToughness() -> String? {
            return self.toughness
        }
        
        // This loyalty if any. Note that some cards have loyalties that are not numeric, such as X.
        var loyalty: String?
        public func getLoyalty() -> String? {
            return self.loyalty
        }
        
        // This card’s colors.
        var colors:[String]?
        public func getColors() -> [String]? {
            return self.colors
        }
        
        // Online listings for these cards names.
        var purchase_uris: [String:String]
        public func getPurchaseURIs() -> [String:String] {
            return self.purchase_uris
        }
        
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

