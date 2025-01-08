//
//  AnimalRow.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

struct AnimalRow: View {
    let animal: Animal
    
    var body: some View {
        HStack {
            Image(animal.thumbnailImage)
            Text(animal.name)
        }
    }
}

struct AnimalRow_Previews: PreviewProvider {
    static var previews: some View {
        let exampleAnimal = Animal.example1 // Using example1 from your provided data
        return AnimalRow(animal: exampleAnimal)
            .previewLayout(.sizeThatFits)
    }
}
