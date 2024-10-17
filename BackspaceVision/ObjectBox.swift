//
//  ObjectBox.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectBox: View {
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                let modelBox = ObjectRowView.boxEntity
                content.add(modelBox)
            }
        }
    }
}

#Preview {
    ObjectBox()
}
