import SwiftUI
import SceneKit

struct ModelSceneView: UIViewRepresentable {
    @Binding var scene: SCNScene?
    
    
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        view.backgroundColor = .clear
        view.isPlaying = true
        
        return view
    }
    
    
    func updateUIView(_ uiView: SCNView, context: Context) {}
}
