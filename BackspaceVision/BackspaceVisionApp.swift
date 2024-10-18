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
        
        ImmersiveSpace(id: "sphere") {
            ObjectSphere()
                .environment(appModel)
                .onAppear {
                    appModel.transitionState = .open
                }
                .onDisappear {
                    appModel.transitionState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        ImmersiveSpace(id: "box") {
            ObjectBox()
                .environment(appModel)
                .onAppear {
                    appModel.transitionState = .open
                }
                .onDisappear {
                    appModel.transitionState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        ImmersiveSpace(id: "cylinder") {
            ObjectCylinder()
                .environment(appModel)
                .onAppear {
                    appModel.transitionState = .open
                }
                .onDisappear {
                    appModel.transitionState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
        ImmersiveSpace(id: "cone") {
            ObjectCone()
                .environment(appModel)
                .onAppear {
                    appModel.transitionState = .open
                }
                .onDisappear {
                    appModel.transitionState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
        
//        WindowGroup(id: "sphere") {
//            ObjectSphere()
//                .environment(appModel)
//        }
//        .defaultSize(CGSize(width: 300, height: 100))
//        .windowStyle(.volumetric)
//        
//        WindowGroup(id: "box") {
//            ObjectBox()
//                .environment(appModel)
//        }
//        .defaultSize(CGSize(width: 300, height: 100))
//        .windowStyle(.volumetric)
//        
//        WindowGroup(id: "cylinder") {
//            ObjectCylinder()
//                .environment(appModel)
//        }
//        .defaultSize(CGSize(width: 300, height: 100))
//        .windowStyle(.volumetric)
//        
//        WindowGroup(id: "cone") {
//            ObjectCone()
//                .environment(appModel)
//        }
//        .defaultSize(CGSize(width: 300, height: 100))
//        .windowStyle(.volumetric)
    }
}

