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
    
    var name: String {
        switch self {
        case .animals: return "Animals"
        case .pelts: return "Pelts"
        case .credits: return "Credits"
        }
    }
    
    var symbol: String {
        switch self {
        case .animals: return "pawprint"
        case .pelts: return "bag"
        case .credits: return "creditcard"
        }
    }
    
    var customizationID: String {
        switch self {
        case .animals: return "animalsTab"
        case .pelts: return "peltsTab"
        case .credits: return "creditsTab"
        }
    }
}
