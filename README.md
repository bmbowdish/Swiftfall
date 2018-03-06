# Swiftfall
Swiftfall is a wrapper written in Swift for the API Scryfall.

[Documentation for Scryfall API.](https://scryfall.com/docs/api)

Scryfall is API which handles information about the card game Magic: The Gathering. 

# Swiftfall Documentation
## Types
All types are Structs and can be reach through a Swiftfall.get*(). 

### Types That Hold Data
#### Card 
 * Struct containing data about a Magic Card.
 * Contains the **Card.Face** Struct
   * Some Cards have faces, **Card.Face** contains those faces. 
#### ScryfallSet
 * Struct containing data about a Set of Magic cards.
 * named ScryfallSet due to Set already existing in Swift.
#### Ruling
 * Struct containing data about a Magic Card's rulings. 
### Structs which contain Arrays of Types 
#### CardList 
 * Struct containing a list of Cards.
#### SetList 
 * Struct containing a list of ScryfallSets.
#### RulingList
 * Struct containing a list of Rulings.
## Functions
These are some functions you can call which will handle information from Scryfall's API. 

### Get a Card
Swiftfall.getCard(fuzzy:String) throws -> Card _(Fuzzy search)_

Swiftfall.getCard(exact:String) throws -> Card _(Exact search)_

Swiftfall.getRandomCard() throws -> Card _(Random Card)_

Ex.
``` 
import Swiftfall
do {
  let card = try Swiftfall.getCard(exact:"Black Lotus")
  print(card)
  } catch {
    ...
}
```
Out.
```
Name: Black Lotus
Cost: {0}
Type Line: Artifact
Oracle Text:
{T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool.
```

#### Double-Sided Cards
Ex.
``` 
import Swiftfall
do {
  let card = Swiftfall.getCard(exact:"Jace, Vryn's Prodigy")
  print(card)
  } catch {
    ...
}
```
Out.
```
Name: Jace, Vryn's Prodigy
Cost: {1}{U}
Type Line: Legendary Creature — Human Wizard
Oracle Text:
{T}: Draw a card, then discard a card. If there are five or more cards in your graveyard, exile Jace, Vryn's Prodigy, then return him to the battlefield transformed under his owner's control.
Power: 0
Toughness: 2
Name: Jace, Telepath Unbound
Cost: 
Type Line: Legendary Planeswalker — Jace
Oracle Text:
+1: Up to one target creature gets -2/-0 until your next turn.
−3: You may cast target instant or sorcery card from your graveyard this turn. If that card would be put into your graveyard this turn, exile it instead.
−9: You get an emblem with "Whenever you cast a spell, target opponent puts the top five cards of his or her library into his or her graveyard."
Loyalty: 5
```

**OR** 

Ex.
``` 
import Swiftfall
do {
  let card = Swiftfall.getCard(exact:"Jace, Vryn's Prodigy")
  let faces = card?.card_faces
  let front = faces![0]
  let back = faces![1]
  print(front)
  print(back)
  } catch {
    ...
}
```
Out. 
```
Name: Jace, Vryn's Prodigy
Cost: {1}{U}
Type Line: Legendary Creature — Human Wizard
Oracle Text:
{T}: Draw a card, then discard a card. If there are five or more cards in your graveyard, exile Jace, Vryn's Prodigy, then return him to the battlefield transformed under his owner's control.
Power: 0
Toughness: 2
Name: Jace, Telepath Unbound
Cost: 
Type Line: Legendary Planeswalker — Jace
Oracle Text:
+1: Up to one target creature gets -2/-0 until your next turn.
−3: You may cast target instant or sorcery card from your graveyard this turn. If that card would be put into your graveyard this turn, exile it instead.
−9: You get an emblem with "Whenever you cast a spell, target opponent puts the top five cards of his or her library into his or her graveyard."
Loyalty: 5
```
### Get a list of Cards
Swiftfall.getCardList() throws -> CardList _(The first page)_

Swiftfall.getCardList(page:Int) throws -> CardList _(Loads a specific page)_

Ex. 
```
import Swiftfall
do {
  let cardlist = Swiftfall.getCardList(page:0) // this is the same as .getCardList()
  print(cardlist)
} catch {
  ... 
}
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

### Get a ScryfallSet
Swiftfall.getSet(code:String) throws -> Set _(String must be a three letter code)_

Ex.
```
import Swiftfall
do { 
  let set = Swiftfall.getSet(code: "KTK")
  print(set) 
} catch {
  ...
}
```
Out.
```
Name: Khans of Tarkir (ktk)
Block: Khans of Tarkir
Number of Cards: 269
Release Date: 2014-09-26
Set Type: expansion
```
### Get a list of ScryfallSets
Swiftfall.getSetList() throws -> SetList _(All Sets)_

Ex.
```
import Swiftfall
do {
  let setlist = Swiftfall.getSetList()
  print(setlist)
} catch {
  ...
}
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
Swiftfall.getRulingList(code:String,number:Int) throws -> RulingList

Ex.
``` 
import Swiftfall
do {
  let rulings = Swiftfall.getRulingList(code: "ima", number: 65)
  print(rulings)
} catch {
  ...
}
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

Once you have a RulingList you may call .data\[index: Int\]

Ex. 
```
import Swiftfall
do {
  let rulings = Swiftfall.getRulingList(code: "ima", number: 65)
  let ruling = rulings?.data[1]
  print(ruling)
} catch {
  ...
}
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
    do { 
      _ = Swiftfall.getRandomCard()
    } catch {
      XCTFail()
    }
}
```

# How to set up Swiftfall
First, create an executable package. The executable includes a Hello World function by default. 
```
$ mkdir MyExecutable
$ cd MyExecutable
$ swift package init --type executable
$ swift build
$ swift run
Hello, World!
```

Next, 

```
$ swift package generate-xcodeproj
```
Then, set Swiftfall as a dependency for the executable.

```
import PackageDescription

let package = Package(
    name: "MyExecutable",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url:"https://github.com/bmbowdish/Swiftfall.git", from: "1.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MyExecutable",
            dependencies: ["Swiftfall"]),
    ]
)
```

Then, run:

```
$ swift package generate-xcodeproj
```

Now you're ready to use Swiftfall!

