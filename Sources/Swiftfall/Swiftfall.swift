import Foundation

class Swiftfall {
    
    static let scryfall = "https://api.scryfall.com/"

    struct Card:Codable {
        // Core Card Fields
        var id:String
        var oracle_id:String
        var multiverse_ids:[Int]
        var mtgo_id:Int
        var mtgo_foil_id:Int
        var name:String
        
        //var uri:String
        //var scryfall_uri:String
        //var prints_search_uri:String
        //var rulings_uri:String
        
        
        init(id:String,oracle_id:String,multiverse_ids:[Int],mtgo_id:Int,mtgo_foil_id:Int,name:String) {
            self.id = id
            self.oracle_id = oracle_id
            self.multiverse_ids = multiverse_ids
            self.mtgo_id = mtgo_id
            self.mtgo_foil_id = mtgo_foil_id
            self.name = name
        }
    }
    
    // fuzzy
    static func card(fuzzy:String) -> Card?
    {
        var card: Card?
        parseCard(call: fuzzy){
            (newcard:Card?) in
            card = newcard
        }
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

