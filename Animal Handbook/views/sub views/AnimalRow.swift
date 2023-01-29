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

//struct AnimalRow_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimalRow(animal: Animal.example)
//    }
//}
