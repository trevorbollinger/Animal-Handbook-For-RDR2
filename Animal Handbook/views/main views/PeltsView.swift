//
//  PeltsView.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

struct PeltsView: View {
    @State var animals: [Animal]
    @State var pelts: [Pelt]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults, id: \.self) { pelt in
                    NavigationLink {
                        PeltDetail(pelt: pelt, compact: false)
                    } label: {
                        PeltRow(pelt: pelt)
                    }
                }
            }
            .navigationTitle(Tabs.pelts.name)
        }
        .searchable(text: $searchText)
    }
    
    var searchResults: [Pelt] {
        if searchText.isEmpty {
            return pelts
        } else {
            return pelts.filter { $0.name.localizedCaseInsensitiveContains(searchText) } }
    }
    
}


struct PeltsView_Preview: PreviewProvider {
    static var previews: some View {
        PeltsView(animals: Animal.exampleList, pelts: Pelt.exampleList)
    }
}
