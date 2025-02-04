import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("I love Cella!")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(.pink)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.pink, lineWidth: 2)
                        .frame(width: 300, height: 70)
                )
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
