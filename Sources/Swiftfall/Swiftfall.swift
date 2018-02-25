import Foundation

class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"
    
    struct Error: Codable{
        var code: String
        var type: String
        var status: Int
        var details: String
        
        init(code:String,type: String,status:Int,details:String) {
            self.code = code
            self.type = type
            self.status = status
            self.details = details
        }
    }
    
    public struct Set: Codable {
        var code: String
        var mtgo: String?
        var name: String
        var uri: String
        var scryfall_uri: String
        var search_uri: String
        var released_at: String
        var set_type: String
        var card_count: Int
        var digital: Bool
        var foil: Bool
        var block_code: String
        var block: String
        var icon_svg_uri: String
        
        init(code: String, mtgo: String?, name: String, uri: String, scryfall_uri: String, search_uri: String, released_at: String, set_type: String, card_count: Int, digital: Bool, foil: Bool, block_code: String, block: String, icon_svg_uri: String){
            self.code = code
            self.mtgo = mtgo
            self.name = name
            self.uri = uri
            self.scryfall_uri = scryfall_uri
            self.search_uri = search_uri
            self.released_at = released_at
            self.set_type = set_type
            self.card_count = card_count
            self.digital = digital
            self.foil = foil
            self.block_code = block_code
            self.block = block
            self.icon_svg_uri = icon_svg_uri
        }
    }

    public struct Card:Codable {
        // Core Card Fields
        var id:String
        var oracle_id:String
        var multiverse_ids:[Int]
        var mtgo_id:Int?
        var mtgo_foil_id:Int?
        var name:String
        
        //var uri:String
        //var scryfall_uri:String
        //var prints_search_uri:String
        //var rulings_uri:String
        
        var layout:String
        var cmc:Int
        var type_line:String
        var oracle_text:String
        var mana_cost:String
        var power: String?
        var toughness: String?
        var colors:[String]
        
        var purchase_uris: [String:String]
        
        init(id:String,oracle_id:String,multiverse_ids:[Int],mtgo_id:Int?,mtgo_foil_id:Int?,name:String,
             layout:String, cmc:Int, type_line:String, oracle_text:String, mana_cost:String, power: String, toughness: String, colors:[String], purchase_uris:[String:String]) {
            self.id = id
            self.oracle_id = oracle_id
            self.multiverse_ids = multiverse_ids
            self.mtgo_id = mtgo_id
            self.mtgo_foil_id = mtgo_foil_id
            self.name = name
            self.layout = layout
            self.cmc = cmc
            self.type_line = type_line
            self.oracle_text = oracle_text
            self.mana_cost = mana_cost
            self.power = power
            self.toughness = toughness
            self.colors = colors
            self.purchase_uris = purchase_uris
        }
        
        public func simplePrint(){
            let simple = "Name: \(name)\nCost: \(mana_cost)\nType Line: \(type_line)\nOracle Text:\n\(oracle_text)\n"
            if self.power != nil && self.toughness != nil {
                print("\(simple)Power: \(power!)\nToughness: \(toughness!)\n")
            } else {print(simple)}
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
                    print("\nError: \(decoded.details)\n")
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

