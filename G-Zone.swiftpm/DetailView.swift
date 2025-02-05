import SwiftUI
import SceneKit

struct DetailView: View {
    @State var scene: SCNScene?
    var detailTitle: String
    var detailContent: String
    
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
                        
                        CreateDetailContent(title:detailTitle, content: detailContent)
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
                .frame(maxWidth: 350, maxHeight: 50)
                .background(RoundedRectangle(cornerRadius: 10).fill(.blue))
        })
        .padding(.top)
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

