//
//  ObjectCylinder.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectCylinder: View {
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                let modelCylinder = ObjectRowView.cylinderEntity
                content.add(modelCylinder)
            }
        }
    }
}

#Preview {
    ObjectCylinder()
}
