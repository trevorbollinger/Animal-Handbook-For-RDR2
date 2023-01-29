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
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(animals) { animal in
                    NavigationLink {
                    AnimalDetail(animal: animal, pelts: pelts)
                    } label: {
                        AnimalRow(animal: animal)
                    }
                }
            }
            .navigationTitle("Animals")
        }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimalsView(animals: Animal.exampleList, pelts: Pelt.exampleList)
//    }
//}
