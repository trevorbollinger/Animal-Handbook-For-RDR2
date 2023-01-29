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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pelts) { pelt in
                    NavigationLink(value: pelt) {
                        PeltRow(pelt: pelt)
                    }
                }
            }
            .navigationDestination(for: Pelt.self) { pelt in
                PeltDetail(pelt: pelt, compact: false)
            }
            .navigationTitle("Drops")
        }
    }
}

//struct PeltsView_Preview: PreviewProvider {
//    static var previews: some View {
//        PeltsView(animals: Animal.exampleList, pelts: Pelt.exampleList)
//    }
//}
