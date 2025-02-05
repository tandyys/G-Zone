//
//  SwiftUIView.swift
//  gzone
//
//  Created by tandyys on 05/02/25.
//

import SwiftUI
import SceneKit

struct DetailView: View {
    @State var scene: SCNScene?
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ModelSceneView(scene: $scene)
                        .frame(height: 350)
                }
            }
            
            Button(action: {
                print("AR button tapped")
            }, label: {
                Text("See the Gravity!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.blue))
            })
            .padding()
        }
    }
}
