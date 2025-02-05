import SwiftUI

struct ContentView: View {
    let models: [String] = ["Mercury.scn", "Venus.scn", "Earth.scn", "Mars.scn", "Jupiter.scn", "Saturn.scn", "Uranus.scn", "Neptune.scn", "Moon.scn"]
    
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    CreateNavigationLink(destination: models[0], planet: "Mercury", color: .gray)
                    
                    CreateNavigationLink(destination: models[1], planet: "Venus", color: .orange)
                }
            }
        }
    }
    
    @ViewBuilder
    func CreateNavigationLink(destination: String, planet: String, color: Color) -> some View {
        NavigationLink(destination: DetailView(scene: .init(named: destination))) {
            Text("Explore " + planet)
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .frame(width: 250, height: 35)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
