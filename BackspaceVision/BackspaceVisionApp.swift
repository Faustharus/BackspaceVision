//
//  BackspaceVisionApp.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import SwiftUI

@main
struct BackspaceVisionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "sphere") {
            ObjectSphere()
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
        
        WindowGroup(id: "box") {
            ObjectBox()
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
        
        WindowGroup(id: "cylinder") {
            ObjectCylinder()
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
        
        WindowGroup(id: "cone") {
            ObjectCone()
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
    }
}

