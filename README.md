# Swiftfall
Swiftfall is a wrapper written in Swift for the API Scryfall.

[Documentation for Scryfall API.](https://scryfall.com/docs/api)

Scryfall is API which handles information about the card game Magic: The Gathering. 

# Swiftfall Documentation
## Types
All types are Structs and can be reach through a Swiftfall.get*(). 

All Structs have a print function called simplePrint().

### Types That Hold Data
#### Card? 
 * Struct containing data about a Magic Card
#### Set? 
 * Struct containing data about a Set of Magic cards
#### Ruling?
 * Struct containing data about a Magic Card's rulings. 
### Structs which contain Arrays of Types 
#### CardList? 
 * Struct containing a list of Cards
#### SetList? 
 * Struct containing a list of Sets
#### RulingList?
 * Struct containing a list of Rulings
## Functions
These are some functions you can call which will handle information from Scryfall's API. 

### Get a Card
Swiftfall.getCard(fuzzy:String) -> Card? _(Fuzzy search)_

Swiftfall.getCard(exact:String) -> Card? _(Exact search)_

Swiftfall.getRandomCard() -> Card? _(Random Card)_

Ex.
``` 
import Swiftfall
let card = Swiftfall.getCard(exact:"Black Lotus")
card?.simplePrint()
```
Out.
```
Name: Black Lotus
Cost: {0}
Type Line: Artifact
Oracle Text:
{T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool.
```
### Get a list of Cards
Swiftfall.getCardList() -> CardList? _(The first page)_

Swiftfall.getCardList(page:Int) -> CardList? _(Loads a specific page)_

Ex. 
```
import Swiftfall
let cardlist = Swiftfall.getCardList(page:0) // this is the same as .getCardList()
cardlist.simplePrint()
```
Out.
```
Card Number: 0

Name: Akroma's Vengeance
Cost: {4}{W}{W}
Type Line: Sorcery
Oracle Text:
Destroy all artifacts, creatures, and enchantments.
Cycling {3} ({3}, Discard this card: Draw a card.)

Card Number: 1
...
...
```

### Get a Set
Swiftfall.getSet(code:String) -> Set? _(String must be a three letter code)_

Ex.
```
import Swiftfall
let set = Swiftfall.getSet(code: "KTK")
set?.simplePrint()
```
Out.
```
Name: Khans of Tarkir (ktk)
Block: Khans of Tarkir
Number of Cards: 269
Release Date: 2014-09-26
Set Type: expansion
```
### Get a list of Set
Swiftfall.getSetList() -> SetList? _(All Sets)_

Ex.
```
import Swiftfall
let setlist = Swiftfall.getSetList()
setlist?.simplePrint()
```
Out.
```
Set Number: 0
Name: Masters 25
Number of Cards: 55
Set Type:masters

Set Number: 1
Name: Masters 25 Tokens
Number of Cards: 1
Set Type:token

Set Number: 2
...
...
```
### Get a list of Rulings
Swiftfall.getRulingList(code:String,number:Int) -> RulingList?
Ex.
``` 
import Swiftfall
let rulings = Swiftfall.getRulingList(code: "ima", number: 65)
rulings?.simplePrint()
```
Out. 
```
Source: wotc
Comments: Mana Drain can target a spell that can’t be countered. When Mana Drain resolves, that spell won’t be countered, but you’ll still add mana to your mana pool at the beginning of your next main phase.

Source: wotc
Comments: If the target spell is an illegal target when Mana Drain tries to resolve, it will be countered and none of its effects will happen. You won’t get any mana.

Source: wotc
Comments: Mana Drain’s delayed triggered ability will usually trigger at the beginning of your precombat main phase. However, if you cast Mana Drain during your precombat main phase or during your combat phase, its delayed triggered ability will trigger at the beginning of that turn’s postcombat main phase.
```

### Get a Ruling
To get a specific ruling you must first get a Ruling List. 

Once you have a RulingList you may call .getData(index: Int)
Ex. 
```
let rulings = Swiftfall.getRulingList(code: "ima", number: 65)
let ruling = rulings?.getData(index: 1)
ruling?.simplePrint()
```
Out. 
```
Source: wotc
Comments: If the target spell is an illegal target when Mana Drain tries to resolve, it will be countered and none of its effects will happen. You won’t get any mana.
```
## Testing 

Testing allows for us to check certain scenarios quickly and determine the problems in a easy to understand and grasp manner. 

### Example
Ex. 
```
func testRandomCard(){
    let card = Swiftfall.getRandomCard()
    XCTAssertTrue(card != nil)
}
```
