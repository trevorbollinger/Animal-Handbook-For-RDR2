//
//  Tabs.swift
//  Animal Handbook for RDR2
//
//  Created by Trevor Bollinger on 6/13/24.
//

enum Tabs: Hashable {
    case animals
    case pelts
    case credits
    case animal(Animal)
    
    var name: String {
        switch self {
        case .animals: return "Animals"
        case .pelts: return "Pelts"
        case .credits: return "Credits"
        case .animal(let animal): return animal.name
        }
    }
    
    var symbol: String {
        switch self {
        case .animals, .animal: return "pawprint"
        case .pelts: return "bag"
        case .credits: return "creditcard"
        }
    }
    
    var customizationID: String {
        switch self {
        case .animals: return "animalsTab"
        case .pelts: return "peltsTab"
        case .credits: return "creditsTab"
        case .animal(let animal): return animal.name // You can use animal name as customization ID
        }
    }
    
    var isSecondary: Bool {
        switch self {
        case .animals, .pelts, .credits:
            false
        default:
            true
        }
    }
}
