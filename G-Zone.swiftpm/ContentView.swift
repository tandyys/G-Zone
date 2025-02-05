import SwiftUI

struct ContentView: View {
    let models: [String] = ["Mercury.scn", "Venus.scn", "Earth.scn", "Mars.scn", "Jupiter.scn", "Saturn.scn", "Uranus.scn", "Neptune.scn", "Moon.scn"]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 250)
                    
                    CreateNavigationLink(destination: models[0], planet: "Mercury")
                    
                    CreateNavigationLink(destination: models[1], planet: "Venus")
                    
                    CreateNavigationLink(destination: models[2], planet: "Earth")
                    
                    CreateNavigationLink(destination: models[3], planet: "Mars")
                    
                    CreateNavigationLink(destination: models[4], planet: "Jupiter")
                    
                    CreateNavigationLink(destination: models[5], planet: "Saturn")
                    
                    CreateNavigationLink(destination: models[6], planet: "Uranus")
                    
                    CreateNavigationLink(destination: models[7], planet: "Neptune")
                    
                    CreateNavigationLink(destination: models[8], planet: "Moon")
                }
            }
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea()
    }
        
    @ViewBuilder
    func CreateNavigationLink(destination: String, planet: String) -> some View {
        NavigationLink(destination: DetailView(scene: .init(named: destination))) {
            Text("Explore " + planet)
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(.black)
                .overlay(
                    Text("Explore " + planet)
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(.white)
                        .offset(x: 2, y: 2)
                )
                .frame(width: 350, height: 70)
                .background(
                    Image(planet)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )
                .padding(.top)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
