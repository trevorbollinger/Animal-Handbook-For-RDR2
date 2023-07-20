//
//  AnimalDetail.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/2/23.
//

import SwiftUI

struct AnimalDetail: View {
    
    let animal: Animal
    let pelts: [Pelt]
    
    @State private var presentedPelt: Pelt? = nil
    
    let paddingAmount = 3.0
    
    var body: some View {
        ScrollView {
            
            Image(animal.mainImage).resizable().scaledToFit()
            
            VStack(alignment: .leading) {
                
                //Description
                if animal.description != "" {
                    VStack(alignment: .leading) {
                        //title
                        HStack(alignment: .center) {
                            Image(systemName: "newspaper")
                                .bold()
                                .font(.headline)
                            
                            Text("Description")
                                .font(.title)
                                .bold()
                                .padding(.top, paddingAmount)
                                .padding(.bottom, paddingAmount)
                            
                            Spacer()
                            
                            if animal.danger == "5" {
                                Image(systemName: "hazardsign.fill")
                            }
                        }
                        //body
                        Text(animal.description)
                            .font(.body)
                    }
                    .padding(.bottom, paddingAmount)
                    
                }

                
                Divider()
                
                //Locations
                VStack(alignment: .leading) {
                    //title
                    HStack{
                        Image(systemName: "map")
                            .bold()
                            .font(.headline)
                        
                        Text("Locations")
                            .bold()
                            .font(.title)
                            .padding(.top, paddingAmount)
                            .padding(.bottom, paddingAmount)
                    }
                    
                    //body
                    ForEach(animal.location, id: \.self) { i in
                        HStack {
                            Image(systemName: "mappin.circle.fill")
                                .font(.footnote)
                            Text(i)
                                .font(.body)
                                .padding(.bottom, paddingAmount/10)
                            
                            
                        }
                    }
                }
                .padding(.bottom, paddingAmount)
                
                Divider()
                
                //Drops
                if animal.loot[0] != "" {
                    VStack(alignment: .leading) {
                        //title
                        HStack{
                            Image(systemName: "bag")
                                .bold()
                                .font(.headline)
                            
                            Text("Drops")
                                .bold()
                                .font(.title)
                                .padding(.top, paddingAmount)
                                .padding(.bottom, paddingAmount)
                        }
                        //body
                        ForEach(animal.loot, id: \.self) { loot in
                            
                            //Matching Loot
                            if pelts.contains { $0.name == loot } {
                                Button {
                                    presentedPelt = convertToPelt(peltName: loot, peltList: pelts)
                                } label: {
                                    HStack {
                                        Image(systemName: "bag.fill.badge.plus")
                                            .font(.footnote)
                                        Text("\(loot)")
                                            .font(.body)
                                            .padding(.bottom, paddingAmount/10)
                                            .foregroundColor(Color("AccentColor"))
                                    }
                                }
                            } else {
                                switch loot {
                                    //Best Quality Meat
                                case "Big Game Meat":
                                    Button {
                                        presentedPelt = pelts[0]
                                    } label: {
                                        HStack {
                                            Image(systemName: "bag.fill.badge.plus")
                                                .font(.footnote)
                                            Text("\(loot)")
                                                .font(.body)
                                                .padding(.bottom, paddingAmount/10)
                                                .foregroundColor(Color("AccentColor"))
                                        }
                                    }
                                    //High Quality Meat
                                case "Exotic Bird Meat", "Mature Venison", "Game Meat", "Succulent Fish", "Prime Beef", "Tender Pork Loin":
                                    Button {
                                        presentedPelt = pelts[1]
                                    } label: {
                                        HStack {
                                            Image(systemName: "bag.fill.badge.plus")
                                                .font(.footnote)
                                            Text("\(loot)")
                                                .font(.body)
                                                .padding(.bottom, paddingAmount/10)
                                                .foregroundColor(Color("AccentColor"))
                                        }
                                    }
                                    //Good Quality Meat
                                case "Plump Bird Meat", "Crustacean Meat", "Gristly Mutton", "Flaky Fish":
                                    Button {
                                        presentedPelt = pelts[2]
                                    } label: {
                                        HStack {
                                            Image(systemName: "bag.fill.badge.plus")
                                                .font(.footnote)
                                            Text("\(loot)")
                                                .font(.body)
                                                .padding(.bottom, paddingAmount/10)
                                                .foregroundColor(Color("AccentColor"))
                                        }
                                    }
                                    //Low Quality Meat
                                case "Gritty Fish", "Gamey Bird Meat", "Stringy Meat", "Herptile Meat":
                                    Button {
                                        presentedPelt = pelts[3]
                                    } label: {
                                        HStack {
                                            Image(systemName: "bag.fill.badge.plus")
                                                .font(.footnote)
                                            Text("\(loot)")
                                                .font(.body)
                                                .padding(.bottom, paddingAmount/10)
                                                .foregroundColor(Color("AccentColor"))
                                        }
                                    }
                                    //Feathers
                                case "Blue Jay Feather", "Booby Feather", "Cardinal Feather", "Chicken Feather", "Condor Feather", "Cormorant Feather", "Crane Feather", "Crow Feather", "Duck Feather", "Eagle Feather", "Egret Feather", "Goose Feather", "Hawk Feather", "Heron Feather", "Loon Feather", "Oriole Feather", "Owl Feather", "Parakeet Feather", "Parrot Feather", "Peccary Feather", "Pelican Feather", "Pheasant Feather", "Pig Feather", "Pigeon Feather", "Quail Feather", "Raven Feather", "Robin Feather", "Rooster Feather", "Seagull Feather", "Songbird Feather", "Sparrow Feather", "Spoonbill Plume", "Turkey Feather", "Vulture Feather", "Waxwing Feather", "Woodpecker Feather", "Bat Wing":
                                    Button {
                                        presentedPelt = pelts[4]
                                    } label: {
                                        HStack {
                                            Image(systemName: "bag.fill.badge.plus")
                                                .font(.footnote)
                                            Text("\(loot)")
                                                .font(.body)
                                                .padding(.bottom, paddingAmount/10)
                                                .foregroundColor(Color("AccentColor"))
                                        }
                                    }
                                case "Flight Feather":
                                    Button {
                                        presentedPelt = pelts[5]
                                    } label: {
                                        HStack {
                                            Image(systemName: "bag.fill.badge.plus")
                                                .font(.footnote)
                                            Text("\(loot)")
                                                .font(.body)
                                                .padding(.bottom, paddingAmount/10)
                                                .foregroundColor(Color("AccentColor"))
                                        }
                                    }
                                    //Everything else
                                default:
                                    HStack {
                                        Image(systemName: "bag.fill.badge.plus")
                                            .font(.footnote)
                                        Text("\(loot)")
                                            .font(.body)
                                            .padding(.bottom, paddingAmount/10)
                                    }
                                    
                                }
                            }
                            
                            
  
                        }
                        .padding(.bottom, paddingAmount)
                        .sheet(item: $presentedPelt) { peltName in
                            PeltDetail(pelt: peltName, compact: true)
                                .presentationDetents([.medium, .large])
                        }
                        Divider()
                    }
                    
                    //Tips
                    if animal.tips != "" {
                        VStack(alignment: .leading) {
                            //title
                            HStack{
                                Image(systemName: "questionmark")
                                    .bold()
                                    .font(.headline)
                                
                                Text("Tips")
                                    .bold()
                                    .font(.title)
                                    .padding(.top, paddingAmount)
                                    .padding(.bottom, paddingAmount)
                            }
                            //body
                            Text(animal.tips)
                                .font(.body)
                        }
                        .padding(.bottom, paddingAmount)
                    }
                    
                    //Trivia
                    if animal.trivia != "" {
                        if animal.tips != "" {
                            Divider() }
                        VStack(alignment: .leading) {
                            //title
                            HStack{
                                Image(systemName: "lightbulb")
                                    .bold()
                                    .font(.headline)
                                
                                Text("Trivia")
                                    .bold()
                                    .font(.title)
                                    .padding(.top, paddingAmount)
                                    .padding(.bottom, paddingAmount)
                            }
                            //body
                            Text(animal.trivia)
                                .font(.body)
                        }
                        .padding(.bottom, paddingAmount)
                        
                    }
                }
            }
            .padding(.horizontal, 10.0)
            .navigationTitle(animal.name)
        }
        
        
    }
}
//
//struct AnimalDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        AnimalDetail(animal: Animal.example, pelts: Pelt.exampleList)
//    }
//}
//
