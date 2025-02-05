//
//  SwiftUIView.swift
//  G-Zone
//
//  Created by tandyys on 05/02/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARSceneView: UIViewRepresentable {
    let gravity: Float
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        arView.session.delegate = context.coordinator
        context.coordinator.arView = arView
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
        context.coordinator.currentGravity = gravity
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(gravity: gravity)
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        weak var arView: ARView?
        var currentGravity: Float
        var hasPlacedObject = false
        
        init(gravity: Float) {
            self.currentGravity = gravity
            super.init()
        }
        
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let arView = arView,
                  !hasPlacedObject,
                  let planeAnchor = anchors.first as? ARPlaneAnchor else { return }
            
            hasPlacedObject = true
            
            var transform = planeAnchor.transform
            transform.columns.3.y += 2
            
            let anchor = AnchorEntity(world: transform)
            
            do {
                // Replace with your model file
                let modelEntity = try ModelEntity.load(named: "Apple.usdz")
                
                // Generate collision shapes
                modelEntity.generateCollisionShapes(recursive: true)
                
                // Configure physics body with gravity
                modelEntity.components[PhysicsBodyComponent.self] = PhysicsBodyComponent(
                    shapes: [.generateBox(width: 0.1, height: 0.1, depth: 0.1)],
                    mass: 1.0,
                    material: .default,
                    mode: .dynamic
                )
                
                modelEntity.scale = SIMD3<Float>(0.1, 0.1, 0.1)
                
                anchor.addChild(modelEntity)
                arView.scene.addAnchor(anchor)
                
                // Create ground plane
                let groundAnchor = AnchorEntity(world: planeAnchor.transform)
                let ground = ModelEntity()
                
                ground.components[PhysicsBodyComponent.self] = PhysicsBodyComponent(
                    shapes: [.generateBox(width: 2, height: 0.001, depth: 2)],
                    mass: 0.0,
                    material: .default,
                    mode: .static
                )
                
                groundAnchor.addChild(ground)
                arView.scene.addAnchor(groundAnchor)
                
            } catch {
                print("Error loading model: \(error)")
            }
        }
    }
}
