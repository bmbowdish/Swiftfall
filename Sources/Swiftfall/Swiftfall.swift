import Foundation

public class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"
    
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
            if let block = self.block , let code = self.code, let release_at = self.released_at {
                print("Name: \(name) (\(code))\nBlock: \(block)\nNumber of Cards: \(card_count)\nRelease Date: \(release_at)\nSet Type: \(set_type)\n")
            }
            else {
                print("Name: \(name)\nNumber of Cards: \(card_count)\nSet Type:\(set_type)\n")
            }
        }
    }

    public struct Card:Codable {
        // Core Card Fields
        var id:String
        public func getID() -> String {
            return self.id
        }
        
        var oracle_id:String
        public func getOracleID() -> String {
            return self.oracle_id
        }
        
        var multiverse_ids:[Int]
        public func getMultiverseIDs()->[Int]{
            return self.multiverse_ids
        }
        
        var mtgo_id:Int?
        public func getmtgoID() -> Int?{
            return self.mtgo_id
        }
        
        var mtgo_foil_id:Int?
        public func getmtgofoilID() -> Int?{
            return self.mtgo_foil_id
        }
        
        var name:String?
        public func getName() -> String?{
            return self.name
        }
        
        var uri:String
        public func getURI() -> String{
            return self.uri
        }
        
        var scryfall_uri:String
        public func getScryfallURI() -> String{
            return self.scryfall_uri
        }
        
        var prints_search_uri:String
        public func getPrintsSearchURI() -> String {
            return self.prints_search_uri
        }
        
        var rulings_uri:String
        public func getRulingsURI() -> String {
            return self.rulings_uri
        }
        
        var layout:String
        public func getLayout() -> String {
            return self.layout
        }
        
        var cmc:Int
        public func getCMC() -> Int {
            return self.cmc
        }
        
        var type_line:String?
        public func getTypeLine() -> String? {
            return self.type_line
        }
        
        var oracle_text:String?
        public func getOracleText() -> String? {
            return self.oracle_text
        }
        
        var mana_cost:String?
        public func getManaCost() -> String? {
            return self.mana_cost
        }
        
        var power: String?
        public func getPower() -> String? {
            return self.power
        }
        
        var toughness: String?
        public func getToughness() -> String? {
            return self.toughness
        }
        
        var colors:[String]?
        public func getColors() -> [String]? {
            return self.colors
        }
        
        var purchase_uris: [String:String]
        public func getPurchaseURIs() -> [String:String] {
            return self.purchase_uris
        }
        
        public func simplePrint(){
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
}

