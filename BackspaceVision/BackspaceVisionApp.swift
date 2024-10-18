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
    }
}

