import Foundation

public class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"
    
    struct Error: Codable{
        var code: String
        var type: String
        var status: Int
        var details: String
        
        func simplePrint(){
            print("Details:\(details)\n")
        }
    }
    
    public struct SetList: Codable {
        var data: [Set?]
        
        func simplePrint(){
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
    
    public struct CardList: Codable {
        var data: [Card?]
        
        func simplePrint(){
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
    
    public struct Set: Codable {
        var code: String?
        var mtgo: String?
        var name: String
        var uri: String
        var scryfall_uri: String
        var search_uri: String
        var released_at: String?
        var set_type: String
        var card_count: Int
        var digital: Bool
        var foil: Bool
        var block_code: String?
        var block: String?
        var icon_svg_uri: String
        
        func simplePrint(){
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
        public func getmtgoID() -> Int?
        {
            return self.mtgo_id
        }
        
        var mtgo_foil_id:Int?
        public func getmtgofoilID() -> Int?
        {
            return self.mtgo_foil_id
        }
        
        var name:String?
        public func getName(){
            
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

