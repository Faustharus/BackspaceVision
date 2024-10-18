//
//  ObjectCylinder.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectCylinder: View {
    
    let modelCylinder = ObjectRowView.cylinderEntity
    
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                modelCylinder.components.set(InputTargetComponent())
                modelCylinder.components.set(CollisionComponent(shapes: [ShapeResource.generateConvex(from: .generateCylinder(height: 0.05, radius: 0.03))]))
                
                content.add(modelCylinder)
            }
            .gesture(
                DragGesture()
                    .targetedToEntity(modelCylinder)
                    .onChanged { value in
                        modelCylinder.position = value.convert(value.location3D, from: .local, to: modelCylinder.parent!)
                    }
            )
        }
    }
}

#Preview {
    ObjectCylinder()
}
