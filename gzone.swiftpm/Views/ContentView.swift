import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                VStack {
                    NavigationLink(destination: DetailView(scene: .init(named: "Mercury.scn"))) {
                        Text("Explore Mercury")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 250, height: 35)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.gray)
                            )
                    }
                    .padding()
                    
                    NavigationLink(destination: DetailView(scene: .init(named: "Venus.scn"))) {
                        Text("Explore Venus")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(width: 250, height: 35)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.blue)
                            )
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
