//
//  ObjectBox.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectBox: View {
    
    let modelBox = ObjectRowView.boxEntity
    
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                modelBox.components.set(InputTargetComponent())
                modelBox.components.set(CollisionComponent(shapes: [ShapeResource.generateConvex(from: .generateBox(size: 0.05))]))
                
                content.add(modelBox)
            }
            .gesture(
                DragGesture()
                    .targetedToEntity(modelBox)
                    .onChanged { value in
                        modelBox.position = value.convert(value.location3D, from: .local, to: modelBox.parent!)
                    }
            )
        }
    }
}

#Preview {
    ObjectBox()
}
