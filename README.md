# Swiftfall
Swiftfall is a wrapper written in Swift for the API Scryfall.

[Documentation for Scryfall API.](https://scryfall.com/docs/api)

Scryfall is API which handles information about the card game Magic: The Gathering. 

What works?
## Types
All types are Structs and can be reach through a Swiftfall.get*(). 

All Structs have a print function called simplePrint().
 
### Card? 
 * Struct containing data about a Magic Card
### Set? 
 * Struct containing data about a Set of Magic cards
### CardList? 
 * Struct containing a list of Cards
### SetList? 
 * Struct containing a list of Sets
## Functions
These are some functions you can call which will handle information from Scryfall's API. 

### Get a Card
Swiftfall.getCard(fuzzy:String) -> Card? _(Fuzzy search)_
Swiftfall.getCard(exact:String) -> Card? _(Exact search)_
Swiftfall.getRandomCard() -> Card? _(Random Card)_

### Get a list of Cards
Swiftfall.getCardList() -> CardList? _(The first page)_
Swiftfall.getCardList(page:Int) -> CardList? _(Loads a specific page)_

### Get a Set
Swiftfall.getSet(code:String) -> Set? _(String must be a three letter code)_

### Get a list of Set
Swiftfall.getSetList() -> SetList? _(All Sets)_
