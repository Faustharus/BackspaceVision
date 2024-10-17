//
//  BackspaceVisionApp.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import SwiftUI

@main
struct BackspaceVisionApp: App {
    
    @State private var appModel = AppModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        WindowGroup(id: "sphere") {
            ObjectSphere()
                .environment(appModel)
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
        
        WindowGroup(id: "box") {
            ObjectBox()
                .environment(appModel)
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
        
        WindowGroup(id: "cylinder") {
            ObjectCylinder()
                .environment(appModel)
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
        
        WindowGroup(id: "cone") {
            ObjectCone()
                .environment(appModel)
        }
        .defaultSize(CGSize(width: 300, height: 100))
        .windowStyle(.volumetric)
    }
}

