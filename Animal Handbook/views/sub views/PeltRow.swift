//
//  PeltRow.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/4/23.
//

import SwiftUI

struct PeltRow: View {
    let pelt: Pelt
    
    var body: some View {
        HStack {
            Image(pelt.thumbnailImage)
            Text(pelt.name)
        }
    }
}

//struct PeltRow_P: PreviewProvider {
//    static var previews: some View {
//        PeltRow(pelt: Pelt.example)
//    }
//}
