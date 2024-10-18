//
//  ObjectCone.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectCone: View {
    
    let modelCone = ObjectRowView.coneEntity
    
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                modelCone.components.set(InputTargetComponent())
                modelCone.components.set(CollisionComponent(shapes: [.generateConvex(from: .generateCone(height: 0.05, radius: 0.025))]))
                
                content.add(modelCone)
            }
            .gesture(
                DragGesture()
                    .targetedToEntity(modelCone)
                    .onChanged { value in
                        modelCone.position = value.convert(value.location3D, from: .local, to: modelCone.parent!)
                    }
            )
        }
    }
}

#Preview {
    ObjectCone()
}
