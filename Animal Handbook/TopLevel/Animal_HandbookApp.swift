import SwiftUI

@main
struct Hunting_HandbookApp: App {
    let animals = Bundle.main.decode([Animal].self, from: "animals.json")
    let pelts = Bundle.main.decode([Pelt].self, from: "pelts.json")
    
    var body: some Scene {
        WindowGroup {
            ContentView(animals: animals, pelts: pelts)
        }
    }
}

struct ContentView: View {
    let animals: [Animal]
    let pelts: [Pelt]
    
    var body: some View {
        if #available(iOS 18.0, *) {
            DestinationTabs(animals: animals, pelts: pelts)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let animals = Animal.exampleList
        let pelts = Pelt.exampleList
        
        ContentView(animals: animals, pelts: pelts)
    }
}
