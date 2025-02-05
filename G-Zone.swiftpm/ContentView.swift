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
                    
                    CreateNavigationLink(destination: models[0], planet: "Mercury", color: .gray)
                    
                    CreateNavigationLink(destination: models[1], planet: "Venus", color: .orange)
                    
                    CreateNavigationLink(destination: models[2], planet: "Earth", color: .gray)
                    
                    CreateNavigationLink(destination: models[3], planet: "Mars", color: .orange)
                    
                    CreateNavigationLink(destination: models[4], planet: "Jupiter", color: .gray)
                    
                    CreateNavigationLink(destination: models[5], planet: "Saturn", color: .orange)
                    
                    CreateNavigationLink(destination: models[6], planet: "Uranus", color: .gray)
                    
                    CreateNavigationLink(destination: models[7], planet: "Neptune", color: .orange)
                    
                    CreateNavigationLink(destination: models[8], planet: "Moon", color: .gray)
                }
            }
            .scrollIndicators(.hidden)
        }
        .ignoresSafeArea()
    }
        
    @ViewBuilder
    func CreateNavigationLink(destination: String, planet: String, color: Color) -> some View {
        NavigationLink(destination: DetailView(scene: .init(named: destination))) {
            Text("Explore " + planet)
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(.white)
                .padding()
                .frame(width: 350, height: 70)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                )
                .padding(.top)
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
