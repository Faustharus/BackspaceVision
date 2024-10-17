//
//  ObjectCone.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectCone: View {
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                let modelCone = ObjectRowView.coneEntity
                content.add(modelCone)
            }
        }
    }
}

#Preview {
    ObjectCone()
}
