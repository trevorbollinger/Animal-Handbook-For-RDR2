//
//  DestinationTabs.swift
//  Animal Handbook for RDR2
//
//  Created by Trevor Bollinger on 6/13/24.
//

import SwiftUI

struct DestinationTabs: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    
    
    @State private var selectedTab: Tabs = .animals
    
    
    
    let animals: [Animal]
    let pelts: [Pelt]
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            Tab(Tabs.animals.name, systemImage: Tabs.animals.symbol, value: .animals) {
                AnimalsView(animals: animals, pelts: pelts)
            }
            
            Tab(Tabs.pelts.name, systemImage: Tabs.pelts.symbol, value: .pelts) {
                PeltsView(animals: animals, pelts: pelts)
            }
            .customizationID(Tabs.pelts.customizationID)
            
            Tab(Tabs.credits.name, systemImage: Tabs.credits.symbol, value: .credits) {
                CreditsView()
            }
            .customizationID(Tabs.credits.customizationID)
            
            
            TabSection(Tabs.animals.name) { // Use selectedTab.name instead of "Animals"
                ForEach(animals, id: \.id) { animal in
                    Tab(animal.name, systemImage: Tabs.animals.symbol, value: Tabs.animal(animal)) {
                        AnimalDetail(animal: animal, pelts: pelts)
                    }
                    .customizationID(Tabs.animal(animal).customizationID)
                }
            }
            .customizationID(Tabs.animals.name)
            #if !os(macOS) && !os(tvOS)
            .defaultVisibility(.hidden, for: .tabBar)
            .hidden(horizontalSizeClass == .compact)
            #endif
            
            
            
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

struct DestinationTabs_Previews: PreviewProvider {
    static var previews: some View {
        let animals = Animal.exampleList
        let pelts = Pelt.exampleList
        
        DestinationTabs(animals: animals, pelts: pelts)

    }
}
