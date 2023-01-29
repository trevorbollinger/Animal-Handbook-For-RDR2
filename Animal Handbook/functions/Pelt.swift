//
//  Pelt.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/4/23.
//

import SwiftUI

struct Pelt: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var trapperItems: [TrapperItem]
    var fenceItems: [FenceItem]
    var campItems: [CampItem]
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
#if DEBUG
    static let example = Pelt(id: UUID(), name: "Alligator Skin", description: "", trapperItems: [TrapperItem.example, TrapperItem.example2], fenceItems: [FenceItem.example], campItems: [CampItem.example])
    
    static let exampleList = [example, example, example]
    
#endif
}

struct TrapperItem: Codable, Hashable, Identifiable {

    var id: UUID
    var name: String
    var price: Double
    var ingredients: [String]

#if DEBUG
    static let example = TrapperItem(id: UUID(), name: "Alligator Ranch Cutter Saddle", price: 107.00, ingredients: ["Perfect Alligator Skin"])
    static let example2 = TrapperItem(id: UUID(), name: "Legendary Alligator Gambler's Hat", price: 22.00, ingredients: ["Legendary Alligator Skin", "Perfect Snake Skin x2"])
#endif

}

struct FenceItem: Codable, Hashable, Identifiable {

    var id: UUID
    var name: String
    var price: Double
    var ingredients: [String]
    var effect: String

#if DEBUG
    static let example = FenceItem(id: UUID(), name: "Alligator Tooth Talisman", price: 40.00, ingredients: ["Legendary Alligator Tooth", "Vintage Civil War Handcuffs", "Gold Jointed Bracelet"], effect:"Lowers the drain speed of Dead Eye Core by 10%")
#endif

}
struct CampItem: Codable, Hashable, Identifiable {

    var id: UUID
    var name: String
    var ingredients: [String]

#if DEBUG
    static let example = CampItem(id: UUID(), name: "Alligator Skull for Arthur's Lodging", ingredients: ["Perfect Alligator Skin"])
#endif

}

func convertToPelt (peltName: String, peltList: [Pelt]) -> Pelt {
    for pelt in peltList {
        if pelt.name == peltName {
            return pelt
        }
    }
    return peltList[0]
}
