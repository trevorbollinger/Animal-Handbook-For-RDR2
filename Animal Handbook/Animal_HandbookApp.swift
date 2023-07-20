//
//  Hunting_HandbookApp.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

@main
struct Hunting_HandbookApp: App {
    let animals = Bundle.main.decode([Animal].self, from: "animals.json")
    let pelts = Bundle.main.decode([Pelt].self, from: "pelts.json")
    
    @State var selectedIndex = 0
    
    let tabNames = ["Animals", "Drops", "Credits"]
    let icons = ["pawprint", "bag", "creditcard"]
    
    var body: some Scene {
        WindowGroup {

            //Views Controller
            switch selectedIndex {
            case 0: AnimalsView(animals: animals, pelts: pelts)
//                    .preferredColorScheme(.dark)
            case 1: PeltsView(animals: animals, pelts: pelts)
//                    .preferredColorScheme(.dark)
            case 2: CreditsView()
//                    .preferredColorScheme(.dark)
            default: AnimalsView(animals: animals, pelts: pelts)
//                    .preferredColorScheme(.dark)
            }
            
            //Tab Bar
            //Divider()
            HStack {
                ForEach(0..<tabNames.count, id: \.self) { i in
                    Spacer()
                    VStack {
                        Image(systemName: icons[i])
                            .frame(height: 20.0)
                            .font(.system(size:23))
                            .foregroundColor(self.selectedIndex == i ? Color("AccentColor") : Color("Foreground"))
                        Text("\(tabNames[i])")
                            .font(.system(size:10, weight: .medium, design: .default))
                            .foregroundColor(self.selectedIndex == i ? Color("AccentColor") : Color("Foreground"))
                            .padding(.top, 1.0)
                    }
                    .onTapGesture {
                        selectedIndex = i
                    }
                    
                    .frame(width: 70.0, height: 60.0)
                    Spacer()
                }
            }
            .frame(height: 41.0)
            
            
        }
    }
}
