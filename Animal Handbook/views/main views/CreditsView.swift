//
//  CreditsView.swift
//  Animal Handbook for RDR2
//
//  Created by Trevor Bollinger on 1/28/23.
//

import SwiftUI

struct CreditsView: View {
    
    let VERSION = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let BUILD = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

    
    var body: some View {
        NavigationView {
            
            //THANKU
            VStack {
                Spacer()
                Image("icon").resizable().frame(width: 175.0, height: 175.0).cornerRadius(30)
                Spacer()
                Text("Thank you for downloading Wildlife Handbook for RDR2!")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 5)
                Spacer()
                
                //CREDIT
                VStack {
                    Text("Information used in this app was sourced from:")
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                    Text("Red Dead Redemption II by Rockstar Games")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.vertical, 5)
                    Divider()
                    Text("Red Dead Wiki on Fandom ( reddead.fandom.com )")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.vertical, 5)

                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Spacer()
                
                //EMAIL
                VStack {
                    Text("If you run into any problems or errors, feel free to shoot me an email at")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                    Text("trevor@boli.dev")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .bold()
                        .padding(.vertical, 5)
                }
                Spacer()
                
                //VERSION
                VStack{
                    Text("Wildlife Handbook for RDR2\nVersion " + "'\(String(describing: VERSION))' \nBuild " + "'\(String(describing: BUILD))'")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                
                
            }
            .padding(.horizontal, 35.0)
        }
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
