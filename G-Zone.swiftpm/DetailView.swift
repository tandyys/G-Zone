import SwiftUI
import SceneKit

struct DetailView: View {
    @State var scene: SCNScene?
    
    var body: some View {
        ZStack {
            Image("space")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                ScrollView {
                    VStack {
                        ModelSceneView(scene: $scene)
                            .frame(height: 350)
                    }
                }
                
                CreateARButton()
                    .ignoresSafeArea()
            }
        }
    }
    
    
    @ViewBuilder
    func CreateARButton() -> some View {
        Button(action: {
            print("AR button tapped")
        }, label: {
            Text("See the Gravity!")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(maxWidth: 300, maxHeight: 50)
                .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
        })
    }
}

