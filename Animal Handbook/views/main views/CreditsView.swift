//
//  CreditsView.swift
//  Animal Handbook for RDR2
//
//  Created by Trevor Bollinger on 1/28/23.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Information used in this app has sourced from the following: ")
                    .font(.title)
                Text("Red Dead Redemption II by Rockstar Games")
                    .font(.headline)
                    .padding(.vertical)
                Text("Red Dead Wiki on Fandom ( reddead.fandom.com )")
                    .font(.headline)

            }
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
