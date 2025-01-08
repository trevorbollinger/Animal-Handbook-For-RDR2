import SwiftUI

struct AnimalDetail: View {
    let animal: Animal
    let pelts: [Pelt]
    @State private var presentedPelt: Pelt? = nil
    
    private let sectionSpacing: CGFloat = 3.0
    
    var body: some View {
        #if os(tvOS)
        HStack(spacing: 32) {
            // Left side - Image
            Image(animal.mainImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: UIScreen.main.bounds.width * 0.45)
            
            // Right side - Information
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Description Section
                    if !animal.description.isEmpty {
                        InfoSection(
                            icon: "newspaper",
                            title: "Description",
                            showDanger: animal.danger == "5"
                        ) {
                            Text(animal.description)
                                .font(.title2)
                        }
                    }
                    
                    // Locations Section
                    InfoSection(icon: "map", title: "Locations") {
                        LocationsList(locations: animal.location)
                    }
                    
                    // Drops Section
                    if !animal.loot.isEmpty {
                        InfoSection(icon: "bag", title: "Drops") {
                            LootList(
                                loot: animal.loot,
                                pelts: pelts,
                                presentedPelt: $presentedPelt
                            )
                        }
                    }
                    
                    // Tips Section
                    if !animal.tips.isEmpty {
                        InfoSection(icon: "questionmark", title: "Tips") {
                            Text(animal.tips)
                                .font(.title2)
                        }
                    }
                    
                    // Trivia Section
                    if !animal.trivia.isEmpty {
                        InfoSection(icon: "lightbulb", title: "Trivia") {
                            Text(animal.trivia)
                                .font(.title2)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .navigationTitle(animal.name)
        .sheet(item: $presentedPelt) { pelt in
            PeltDetail(pelt: pelt, compact: true)
                .presentationDetents([.medium, .large])
        }
        #else
        ScrollView {
            VStack(alignment: .leading, spacing: sectionSpacing) {
                // Header Image
                Image(animal.mainImage)
                    .resizable()
                    .scaledToFit()
                
                VStack(alignment: .leading, spacing: 16) {
                    // Description Section
                    if !animal.description.isEmpty {
                        InfoSection(
                            icon: "newspaper",
                            title: "Description",
                            showDanger: animal.danger == "5"
                        ) {
                            Text(animal.description)
                        }
                    }
                    
                    // Locations Section
                    InfoSection(icon: "map", title: "Locations") {
                        LocationsList(locations: animal.location)
                    }
                    
                    // Drops Section
                    if !animal.loot.isEmpty {
                        InfoSection(icon: "bag", title: "Drops") {
                            LootList(
                                loot: animal.loot,
                                pelts: pelts,
                                presentedPelt: $presentedPelt
                            )
                        }
                    }
                    
                    // Tips Section
                    if !animal.tips.isEmpty {
                        InfoSection(icon: "questionmark", title: "Tips") {
                            Text(animal.tips)
                        }
                    }
                    
                    // Trivia Section
                    if !animal.trivia.isEmpty {
                        InfoSection(icon: "lightbulb", title: "Trivia") {
                            Text(animal.trivia)
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(animal.name)
        .sheet(item: $presentedPelt) { pelt in
            PeltDetail(pelt: pelt, compact: true)
                .presentationDetents([.medium, .large])
        }
        #endif
    }
}

// MARK: - Supporting Views
private struct InfoSection<Content: View>: View {
    let icon: String
    let title: String
    var showDanger: Bool = false
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .bold()
                    .font(.title)
                
                Text(title)
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                
                if showDanger {
                    Image(systemName: "hazardsign.fill")
                        .font(.title)
                }
            }
            
            content()
            
            Divider()
        }
    }
}

private struct LocationsList: View {
    let locations: [String]
    
    var body: some View {
        ForEach(locations, id: \.self) { location in
            HStack {
                Image(systemName: "mappin.circle.fill")
                    .font(.title2)
                Text(location)
                    .font(.title2)
            }
            #if os(tvOS)
            .padding(.vertical, 4)
            #endif
        }
    }
}

private struct LootList: View {
    let loot: [String]
    let pelts: [Pelt]
    @Binding var presentedPelt: Pelt?
    
    var body: some View {
        ForEach(loot, id: \.self) { item in
            LootButton(
                item: item,
                pelts: pelts,
                presentedPelt: $presentedPelt
            )
        }
    }
}

private struct LootButton: View {
    let item: String
    let pelts: [Pelt]
    @Binding var presentedPelt: Pelt?
    
    var body: some View {
        Button {
            presentedPelt = determineSelectedPelt(for: item)
        } label: {
            HStack {
                Image(systemName: "bag.fill.badge.plus")
                    .font(.title2)
                Text(item)
                    .font(.title2)
                    .foregroundColor(isInteractive ? .accentColor : .primary)
            }
            #if os(tvOS)
            .padding(.vertical, 4)
            #endif
        }
        .disabled(!isInteractive)
    }
    
    private var isInteractive: Bool {
        pelts.contains(where: { $0.name == item }) || isSpecialLoot(item)
    }
    
    private func determineSelectedPelt(for item: String) -> Pelt? {
        if let matchingPelt = pelts.first(where: { $0.name == item }) {
            return matchingPelt
        }
        
        return getPeltForSpecialLoot(item, from: pelts)
    }
}

// MARK: - Helper Functions
private func getPeltForSpecialLoot(_ loot: String, from pelts: [Pelt]) -> Pelt? {
    // Safety check for empty pelts array
    guard !pelts.isEmpty else { return nil }
    
    switch loot {
    case "Big Game Meat":
        return pelts.count > 0 ? pelts[0] : nil
    case "Exotic Bird Meat", "Mature Venison", "Game Meat", "Succulent Fish", "Prime Beef", "Tender Pork Loin":
        return pelts.count > 1 ? pelts[1] : nil
    case "Plump Bird Meat", "Crustacean Meat", "Gristly Mutton", "Flaky Fish":
        return pelts.count > 2 ? pelts[2] : nil
    case "Gritty Fish", "Gamey Bird Meat", "Stringy Meat", "Herptile Meat":
        return pelts.count > 3 ? pelts[3] : nil
    case let feather where isFeather(feather):
        return pelts.count > 4 ? pelts[4] : nil
    case "Flight Feather":
        return pelts.count > 5 ? pelts[5] : nil
    default:
        return nil
    }
}

private func isFeather(_ loot: String) -> Bool {
    let feathers = ["Blue Jay Feather", "Booby Feather", "Cardinal Feather", "Chicken Feather",
                   "Condor Feather", "Cormorant Feather", "Crane Feather", "Crow Feather",
                   "Duck Feather", "Eagle Feather", "Egret Feather", "Goose Feather",
                   "Hawk Feather", "Heron Feather", "Loon Feather", "Oriole Feather",
                   "Owl Feather", "Parakeet Feather", "Parrot Feather", "Peccary Feather",
                   "Pelican Feather", "Pheasant Feather", "Pig Feather", "Pigeon Feather",
                   "Quail Feather", "Raven Feather", "Robin Feather", "Rooster Feather",
                   "Seagull Feather", "Songbird Feather", "Sparrow Feather", "Spoonbill Plume",
                   "Turkey Feather", "Vulture Feather", "Waxwing Feather", "Woodpecker Feather",
                   "Bat Wing"]
    return feathers.contains(loot)
}

private func isSpecialLoot(_ loot: String) -> Bool {
    getPeltForSpecialLoot(loot, from: []) != nil
}
