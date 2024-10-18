//
//  ObjectSphere.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectSphere: View {
    
    @State private var isTapped: Bool = false
    let modelSphere = ObjectRowView.sphereEntity
    
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                modelSphere.components.set(InputTargetComponent())
                modelSphere.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.035)]))
                
                content.add(modelSphere)
            } update: { content in
                if let modelSphere = content.entities.first {
                    modelSphere.transform.scale = isTapped ? [1.5, 1.5, 1.5] : [1.0, 1.0, 1.0]
                }
            }
            .gesture(
                TapGesture()
                    .targetedToAnyEntity()
                    .onEnded { _ in
                        isTapped.toggle()
                    }
            )
        }
    }
}

#Preview {
    ObjectSphere()
}
