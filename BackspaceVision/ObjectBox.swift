//
//  ObjectBox.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import RealityKit
import SwiftUI

struct ObjectBox: View {
    @State var isDragging: Bool = false
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { _ in self.isDragging = true }
            .onEnded { _ in self.isDragging = false }
    }
    
    var body: some View {
        GeometryReader3D { proxy in
            RealityView { content in
                let modelBox = ObjectRowView.boxEntity
                content.add(modelBox)
            }
            .gesture(drag)
        }
    }
}

#Preview {
    ObjectBox()
}
