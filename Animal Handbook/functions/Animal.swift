//
//  Animal.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

struct Animal: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var description: String
    var location: [String]
    var loot: [String]
    var tips: String
    var trivia: String
    var danger: String
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
#if DEBUG
    static let example = Animal(id: UUID(), name: "Alligator", description: "The cougar, which is also commonly referred to as a puma or mountain lion, is the second largest cat in North America. Unlike the actual big cats, however, the cougar cannot roar. Instead, the large feline purrs like a domestic cat. They have slender bodies and are difficult to spot due to their low stance and tan color that acts as camouflage, and the fact that they are silent when running or stalking.\n\nThese solitary predators have no natural enemies and sit atop the food chain. However, they occasionally compete with other predators such as bears and wolves for food. Skinning the cougar after killing it will net you Big Game Meat and Cougar Fangs.\n\nCougars are native to the states of New Austin, West Elizabeth and remote forested sections of New Hanover. As carnivores, they prey on deer, elk, moose, and mountain goats. The easiest way to take down a cougar of this size is by either using a Bow with Poison Arrows or a rifle. Their fangs can be used for crafting and their meat can be used as food", location: ["New Austin", "Big Valley", "Roanoke Ridge", "Nebraska", "The Loess Hills", "Bayou Nwa (southern - eastern parts)"], loot: ["Alligator Skin", "Flight Feather", "Gamey Bird Meat", "Cormorant Carcass"], tips: "Due to its speed and ability to kill players very quickly, it is recommended to always keep weapons drawn and the Dead Eye bar filled when hunting cougars.\n\nUse a Rifle or Bow and Poison Arrows to get a Perfect Cougar Pelt.\n\nPerfect Cougar Pelts can be sold to a trapper in order to craft the Cougar Cutaway Coat, Rustic Vest, and Cougar McClelland Saddle.\n\nThe Cougar Fang Trinket can be crafted at a Fence Shop with the Legendary Cougar Fang dropped by the Legendary Cougar.\n\nRaising a weapon skyward and firing when a cougar is audible/nearby can lead to it revealing itself on the minimap and charging towards the player's location, allowing them to discern its location before being ambushed.\n\nCougars seem to be afraid to enter the water: staying in the middle of it can give time to target them accurately.\n\nIf players are going for the achievements/trophies, they can hit cougars in the back of their torsoes with a poisonous throwing knife or a poisonous arrow. This way they can stop their attacks and break down on the ground. Once on the ground the player can study them easily and finish them off with their knife", trivia: "Like with the Cat and the Wolf, their tapetum lucidum shows a feature that wasn’t in the original Red Dead Redemption.\n\nUnlike the first game, cougars can be albino when encountered in the wild (not only rarely but also the only non-legendary animal to be this way).\n\nThe side-mission 'He's British, of Course' features a cougar painted to resemble a tiger\n\nThe 6th Master Hunter Challenge requires you to kill five cougars with a bow and skin them", danger: "5")
    static let example2 = Animal(id: UUID(), name: "Alligator", description: "The cougar, which is also commonly referred to as a puma or mountain lion, is the second largest cat in North America. Unlike the actual big cats, however, the cougar cannot roar. Instead, the large feline purrs like a domestic cat. They have slender bodies and are difficult to spot due to their low stance and tan color that acts as camouflage, and the fact that they are silent when running or stalking.\n\nThese solitary predators have no natural enemies and sit atop the food chain. However, they occasionally compete with other predators such as bears and wolves for food. Skinning the cougar after killing it will net you Big Game Meat and Cougar Fangs.\n\nCougars are native to the states of New Austin, West Elizabeth and remote forested sections of New Hanover. As carnivores, they prey on deer, elk, moose, and mountain goats. The easiest way to take down a cougar of this size is by either using a Bow with Poison Arrows or a rifle. Their fangs can be used for crafting and their meat can be used as food", location: ["New Austin", "Big Valley", "Roanoke Ridge", "Nebraska", "The Loess Hills", "Bayou Nwa (southern - eastern parts)"], loot: ["Alligator Skin", "Flight Feather", "Gamey Bird Meat", "Cormorant Carcass"], tips: "Due to its speed and ability to kill players very quickly, it is recommended to always keep weapons drawn and the Dead Eye bar filled when hunting cougars.\n\nUse a Rifle or Bow and Poison Arrows to get a Perfect Cougar Pelt.\n\nPerfect Cougar Pelts can be sold to a trapper in order to craft the Cougar Cutaway Coat, Rustic Vest, and Cougar McClelland Saddle.\n\nThe Cougar Fang Trinket can be crafted at a Fence Shop with the Legendary Cougar Fang dropped by the Legendary Cougar.\n\nRaising a weapon skyward and firing when a cougar is audible/nearby can lead to it revealing itself on the minimap and charging towards the player's location, allowing them to discern its location before being ambushed.\n\nCougars seem to be afraid to enter the water: staying in the middle of it can give time to target them accurately.\n\nIf players are going for the achievements/trophies, they can hit cougars in the back of their torsoes with a poisonous throwing knife or a poisonous arrow. This way they can stop their attacks and break down on the ground. Once on the ground the player can study them easily and finish them off with their knife", trivia: "Like with the Cat and the Wolf, their tapetum lucidum shows a feature that wasn’t in the original Red Dead Redemption.\n\nUnlike the first game, cougars can be albino when encountered in the wild (not only rarely but also the only non-legendary animal to be this way).\n\nThe side-mission 'He's British, of Course' features a cougar painted to resemble a tiger\n\nThe 6th Master Hunter Challenge requires you to kill five cougars with a bow and skin them", danger: "5")
    
    static let exampleList = [example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example, example2, example]
#endif
    
}
