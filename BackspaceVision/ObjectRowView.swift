//
//  ObjectRowView.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ObjectRowView: View {
    
    let objects = [Objects]()
    let object: Objects
    
    var body: some View {
        Group {
            RealityView { content in
                addGeometricShapes(to: content, object.shape)
            }
        }
    }
}

#Preview {
    ObjectRowView(object: Objects.localJSONData[0])
}

// MARK: Model Component
extension ObjectRowView {
    
    static let greenMaterial = SimpleMaterial(color: .green, isMetallic: false)
    static let blueMaterial = SimpleMaterial(color: .blue, isMetallic: false)
    static let yellowMaterial = SimpleMaterial(color: .yellow, isMetallic: false)
    static let redMaterial = SimpleMaterial(color: .red, isMetallic: false)
    
    static let sphereEntity: Entity = {
        let entity = Entity()
        
        let sphereSize: Float = 0.035
        let sphereMesh = MeshResource.generateSphere(radius: sphereSize)
        
        entity.components.set(ModelComponent(mesh: sphereMesh, materials: [greenMaterial]))
        
        return entity
    }()
    
    static let boxEntity: Entity = {
        let entity = Entity()
        
        let boxSize: Float = 0.05
        let boxMesh = MeshResource.generateBox(size: boxSize)
        
        entity.components.set(ModelComponent(mesh: boxMesh, materials: [blueMaterial]))
        
        return entity
    }()
    
    static let cylinderEntity: Entity = {
        let entity = Entity()
        
        let cylinderHeight: Float = 0.05
        let cylinderRadius: Float = 0.03
        let boxMesh = MeshResource.generateCylinder(height: cylinderHeight, radius: cylinderRadius)
        
        entity.components.set(ModelComponent(mesh: boxMesh, materials: [yellowMaterial]))
        
        return entity
    }()
    
    static let coneEntity: Entity = {
        let entity = Entity()
        
        let coneHeight: Float = 0.05
        let coneRadius: Float = 0.025
        let boxMesh = MeshResource.generateCone(height: coneHeight, radius: coneRadius)
        
        entity.components.set(ModelComponent(mesh: boxMesh, materials: [redMaterial]))
        
        return entity
    }()
    
}

// MARK: Function
extension ObjectRowView {
    
    func addGeometricShapes(to content: RealityViewContent, _ shapeName: String) {
        switch shapeName {
        case "sphere":
            let modelSphere = ObjectRowView.sphereEntity
            content.add(modelSphere)
        case "box":
            let modelBox = ObjectRowView.boxEntity
            content.add(modelBox)
        case "cylinder":
            let modelCylinder = ObjectRowView.cylinderEntity
            content.add(modelCylinder)
        case "cone":
            let modelCone = ObjectRowView.coneEntity
            content.add(modelCone)
        default:
            break
        }
    }
    
}
