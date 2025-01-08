//
//  AnimalsView.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

struct AnimalsView: View {
    @State var animals: [Animal]
    @State var pelts: [Pelt]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.id) { animal in
                    NavigationLink {
                        AnimalDetail(animal: animal, pelts: pelts)
                    } label: {
                        AnimalRow(animal: animal)
                    }
                }
            }
            .navigationTitle(Tabs.animals.name)

        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Animal] {
        if searchText.isEmpty {
            return animals
        } else {
            return animals.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}


struct AnimalsView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsView(animals: Animal.exampleList, pelts: Pelt.exampleList)
    }
}
