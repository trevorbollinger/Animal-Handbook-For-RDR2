//
//  PeltDetail.swift
//  Hunting Handbook
//
//  Created by Trevor Bollinger on 1/4/23.
//

import SwiftUI

struct PeltDetail: View {
    
    let pelt: Pelt
    let compact: Bool
    
    let paddingAmount = 3.0
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                
                //Title
                if compact {
                    Text("\(pelt.name)")
                        .font(.custom("ChineseRocksFree", size: 40))
                        .bold()
                        .padding(.bottom, paddingAmount)
                }
                
                //Body
                if pelt.trapperItems[0].name == "" && pelt.fenceItems[0].name == "" && pelt.campItems[0].name == "" {
                    HStack {
                        Text(pelt.description)
                            .lineSpacing(5.0)
                        Spacer()
                    }
                } else {
                    VStack(alignment: .leading) {
                        
                        //trapper items
                        if pelt.trapperItems[0].name != "" {
                            Divider()
                            
                            Text("Trapper Items")
                                .font(.title).bold()
                                .padding(.bottom, paddingAmount)
                            ForEach(0..<pelt.trapperItems.count, id: \.self) { i in
                                
                                HStack {
                                    Text(pelt.trapperItems[i].name)
                                        .font(.headline)
                                        .bold()
                                        .padding(.bottom, paddingAmount)
                                    
                                    Spacer()
                                    
                                    Text("$\(pelt.trapperItems[i].price, specifier: "%.2f")")
                                        .font(.custom("ChineseRocksFree", size: 17))
                                    
                                        .bold()
                                        .padding(.bottom, paddingAmount)
                                        .foregroundColor(Color("Money"))
                                    
                                }
                                
                                ForEach(pelt.trapperItems[i].ingredients, id: \.self) { ingredient in
                                    Text("  - "+ingredient)
                                    // .padding(.bottom, paddingAmount)
                                }
                                
                                if i != pelt.trapperItems.count - 1 {
                                    Divider()
                                        .padding(.horizontal, 120.0)
                                }
                                
                            }
                        }
                        
                        //fence items
                        if pelt.fenceItems[0].name != "" {
                            Divider()
                            Text("Fence Items")
                                .font(.title)
                                .bold()
                                .padding(.bottom, paddingAmount)
                            
                            ForEach(0..<pelt.fenceItems.count, id: \.self) { i in
                                HStack {
                                    Text(pelt.fenceItems[i].name)
                                        .font(.headline)
                                        .bold()
                                        .padding(.bottom, paddingAmount)
                                    
                                    Spacer()
                                    
                                    Text("$\(pelt.fenceItems[i].price, specifier: "%.2f")")
                                        .font(.custom("ChineseRocksFree", size: 17))
                                        .bold()
                                        .padding(.bottom, paddingAmount)
                                        .foregroundColor(Color("Money"))
                                }
                                
                                HStack() {
                                    Spacer()
                                    Text("\(pelt.fenceItems[i].effect)")
                                        .italic()
                                        .padding(.bottom, paddingAmount)
                                    Spacer()
                                }
                                ForEach(pelt.fenceItems[i].ingredients, id: \.self) { ingredient in
                                    Text("  -"+ingredient)
                                        .padding(.bottom, paddingAmount)
                                }
                                if i != pelt.fenceItems.count - 1 {
                                    Divider()
                                        .padding(.horizontal, 120.0)
                                }
                            }
                        }
                        
                        //camp items
                        if pelt.campItems[0].name != "" {
                            Divider()
                            Text("Camp Items")
                                .font(.title)
                                .bold()
                                .padding(.bottom, paddingAmount)
                            ForEach(0..<pelt.campItems.count, id: \.self) { i in
                                Text(pelt.campItems[i].name)
                                    .font(.headline)
                                    .bold()
                                    .padding(.bottom, paddingAmount)
                                
                                    .padding(.bottom, paddingAmount)
                                ForEach(pelt.campItems[i].ingredients, id: \.self) { ingredient in
                                    Text("  -"+ingredient)
                                        .padding(.bottom, paddingAmount)
                                }
                                if i != pelt.campItems.count - 1 {
                                    Divider()
                                        .padding(.horizontal, 120.0)
                                }
                            }
                        }
                    }
                    .padding(.bottom, paddingAmount)
                    
                }
                Spacer()
            }
            .padding(.all)
            .navigationTitle(compact ? "Details" : "\(pelt.name)")
        }
    }
}

//struct PeltDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        PeltDetail(pelt: Pelt.example, compact: true)
//    }
//}
