
// factory
import Darwin
import Foundation

// Define what a card is
protocol Card {
    var name: String? {get set}
    var attack: Int? {get set}
    var defense: Int? {get set}
    var mana: Int? {get set}
    func clone() -> Card
    func toString() -> String
}

// AbstractCard
// implements the signature and some properties
class AbstractCard: NSObject, Card {
    private var _name: String?
    private var _attack: Int?
    private var _defense: Int?
    private var _mana: Int?

    init(name: String?, attack: Int?, defense: Int?, mana: Int?) {
        super.init()
        self._name = name
        self._attack = attack
        self._defense = defense
        self._mana = mana   
    }

    override init() {
        super.init()
    }

    // property name
    var name: String? {
        get {
            return _name
        }
        set {
            _name = newValue
        }
    }
    
    // property attack
    var attack: Int? {
        get {
            return _attack
        }
        set {
            _attack = newValue
        }
    }

    // property defence
    var defense: Int? {
        get {
            return _defense
        }
        set {
            _defense = newValue
        }
    }

    // property mana
    var mana: Int? {
        get {
            return _mana
        }
        set {
            _mana = newValue
        }
    }

    func clone() -> Card {
        return AbstractCard(name: self.name, attack: self.attack, defense: self.defense, mana: self.mana)
    }

    func toString() -> String {
        return ("\(self.name, self.attack, self.defense, self.mana)")
    }
}

enum CardType {
    case FacelessManipulator, RaidLeader
}


// our Factory Class
// Depending what we need, this class returns an instance of the appropriate object.
class CardFactory {
    class func createCard(cardtype: CardType) -> Card? {
        switch cardtype {
        case .FacelessManipulator:
            return FacelessManipulatorCard()
        
        case .RaidLeader:
            return RaidLeaderCard()

        //default:
        //    return nil                
            
        }
    }
}

// Concrete Card "Raild Leader"
// This is the full definition of the Raid Leader Card
class RaidLeaderCard: AbstractCard {
    override init() {
        super.init()
        self._name = "Raid Leader"
        self._attack = 2
        self._defense = 2
        self._mana = 3
    }
}

// Concrete Card "Faceless Manipulator"
// This is the full definition of the Raid FacelessManipulator Card
class FacelessManipulatorCard: AbstractCard {
    override init() {
        super.init()
        self._name = "Faceless Manipulator"
        self._attack = 3
        self._defense = 3
        self._mana = 5
    }
}

// simulate our client
var c = CardFactory.createCard(.FacelessManipulator)
print(c?.toString())

