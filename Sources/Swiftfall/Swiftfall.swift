import Foundation

class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"

    public struct Card:Codable {
        // Core Card Fields
        var id:String
        var oracle_id:String
        var multiverse_ids:[Int]
        //var mtgo_id:Int
        //var mtgo_foil_id:Int
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
        
        
        init(id:String,oracle_id:String,multiverse_ids:[Int],mtgo_id:Int,mtgo_foil_id:Int,name:String,
             layout:String, cmc:Int, type_line:String, oracle_text:String, mana_cost:String , colors:[String]) {
            self.id = id
            self.oracle_id = oracle_id
            self.multiverse_ids = multiverse_ids
            //self.mtgo_id = mtgo_id
            //self.mtgo_foil_id = mtgo_foil_id
            self.name = name
            self.layout = layout
            self.cmc = cmc
            self.type_line = type_line
            self.oracle_text = oracle_text
            self.mana_cost = mana_cost
            self.colors = colors
        }
        
        init(id:String,oracle_id:String,multiverse_ids:[Int],mtgo_id:Int,mtgo_foil_id:Int,name:String,
             layout:String, cmc:Int, type_line:String, oracle_text:String, mana_cost:String, power: String, toughness: String, colors:[String]) {
            self.id = id
            self.oracle_id = oracle_id
            self.multiverse_ids = multiverse_ids
            //self.mtgo_id = mtgo_id
            //self.mtgo_foil_id = mtgo_foil_id
            self.name = name
            self.layout = layout
            self.cmc = cmc
            self.type_line = type_line
            self.oracle_text = oracle_text
            self.mana_cost = mana_cost
            self.power = power
            self.toughness = toughness
            self.colors = colors
        }
        
        public func simplePrint(){
            var simple = "Name: \(name)\nCost: \(mana_cost)\nType Line: \(type_line)\nOracle Text:\n\(oracle_text)\n"
            if self.power != nil && self.toughness != nil {
                print("\(simple)Power: \(power!)\nToughness: \(toughness!)\n")
            } else {print(simple)}
            
        }
    }
    
    // fuzzy
    public static func getCard(fuzzy: String) -> Card?
    {
        print("Fuzzy!\n")
        let encodeFuzz = fuzzy.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?fuzzy=\(encodeFuzz)"

        var card: Card?
        var stop = false
        parseCard(call: call){
            (newcard:Card?) in
            card = newcard
            stop = true
        }
        
        // This is to stop thi
        while(!stop){
            //print("stopped")
        }
        
        //card?.simplePrint()
        
        return card
    }
    
    // exact
    public static func getCard(exact: String) -> Card?
    {
        print("Exact!\n")
        let encodeExactly = exact.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let call = "cards/named?exact=\(encodeExactly)"
        
        var card: Card?
        var stop = false
        parseCard(call: call){
            (newcard:Card?) in
            card = newcard
            stop = true
        }
        
        // This is to stop thi
        while(!stop){
            //print("stopped")
        }
        
        //card?.simplePrint()
        
        return card
    }
    
    //static func scryfallAPI(url:String) {
    //
    //}
    
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
                // Present an alert if the JSON data cannot be decoded.
                print("\(error)")
            }
        }
        task.resume()
    }
}

