import SwiftUI

struct CreditsView: View {
    @Environment(\.openURL) private var openURL
    
    let VERSION = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let BUILD = Bundle.main.infoDictionary?["CFBundleVersion"] as? String

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image("icon")
                    .resizable()
                    .frame(width: 175.0, height: 175.0)
                    .cornerRadius(30)
                Spacer()
                Text("Thank you for downloading Wildlife Handbook for RDR2!")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 5)
                Spacer()
                
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
                    HStack {
                        Text("Red Dead Wiki on Fandom (")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .bold()
                        Text("reddead.fandom.com")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .bold()
                            .foregroundColor(.blue)
                            .underline()
                            .onTapGesture {
                                if let url = URL(string: "https://reddead.fandom.com") {
                                    openURL(url)
                                }
                            }
                        Text(")")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .bold()
                    }
                    .padding(.vertical, 5)
                }
                .padding(.all)
                Spacer()
                
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
                
                VStack {
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
