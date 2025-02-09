//
//  SwiftUIView.swift
//  G-Zone
//
//  Created by tandyys on 05/02/25.
//

import SwiftUI
import ARKit

struct ARSCNViewContainer: UIViewRepresentable {
    let gravity: Float
    
    
    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        arView.scene = SCNScene()
        
        arView.scene.physicsWorld.gravity = SCNVector3(0, -gravity, 0)
        
        let config = ARWorldTrackingConfiguration()
        arView.session.run(config)
        
        let appleNode = addApple()
        arView.scene.rootNode.addChildNode(appleNode)
        
        let groundNode = addGround()
        arView.scene.rootNode.addChildNode(groundNode)
        
        return arView
    }
    
    
    func updateUIView(_ uiView: ARSCNView, context: Context) {}
    
    
    func addApple() -> SCNNode {
        if let appleModel = SCNScene(named: "Apple.usdz"),
           let appleModelNode = appleModel.rootNode.childNodes.first {
            
            appleModelNode.position = SCNVector3(0, 2, -50)
            appleModelNode.scale = SCNVector3(0.1, 0.1, 0.1)
            
            let physicsBody = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(node: appleModelNode, options: nil))
            physicsBody.mass = 0.2
            physicsBody.isAffectedByGravity = true
            appleModelNode.physicsBody = physicsBody
            
            return appleModelNode
        } else {
            fatalError("Can't load the apple model")
        }
    }
    
    
    func addGround() -> SCNNode {
        let ground = SCNBox(width: 2, height: 0.05, length: 3, chamferRadius: 0)
        let groundNode = SCNNode(geometry: ground)
       
        groundNode.position = SCNVector3(0, -30, -50)
        groundNode.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(geometry: ground, options: nil))
        
        return groundNode
    }
}
