import SwiftUI
import SceneKit

struct DetailView: View {
    @State var scene: SCNScene?
    var detailTitle: String
    var detailContent: String
    var planetGravity: Float
    
    
    var body: some View {
        ZStack {
            Image("space")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                NavigationStack {
                    ScrollView {
                        VStack {
                            ModelSceneView(scene: $scene)
                                .frame(height: 350)
                            
                            CreateDetailContent(title:detailTitle, content: detailContent)
                        }
                    }
                    
                    CreateARNavigation()
                        .ignoresSafeArea()
                }
            }
        }
    }
    
    
    @ViewBuilder
    func CreateARNavigation() -> some View {
        NavigationLink(destination: ARSCNViewContainer(gravity: planetGravity)) {
            Text("See the Gravity!")
                .font(.system(size: 24, weight: .heavy))
                .foregroundStyle(.white)
                .frame(width: 350, height: 50)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.blue)
                )
                .padding(.top)
        }
    }
    
    @ViewBuilder
    func CreateDetailContent(title: String, content: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
            Text(content)
                .font(.body)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.bottom)
        }
        .frame(maxWidth: 350, maxHeight: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.black.opacity(0.7))
        )
    }
}
