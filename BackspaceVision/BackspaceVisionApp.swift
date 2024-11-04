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
    @PhysicalMetric(from: .meters) private var oneMeter = 1.5
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }
        
        // MARK: Attempt for Dynamic ID
        WindowGroup(for: Objects.self) { $object in
            if let objects = appModel.objects.first(where: { $0 == object }) {
                ObjectRowView(object: objects)
                    .environment(appModel)
                    .onAppear {
                        appModel.transitionState = .open
                    }
                    .onDisappear {
                        appModel.transitionState = .closed
                    }
            }
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 150, height: 150, depth: 100)
        
//        ImmersiveSpace(id: "sphere") {
//            ObjectSphere()
//                .environment(appModel)
//                .offset(z: -oneMeter)
//                .offset(x: 0, y: -oneMeter)
//                .onAppear {
//                    appModel.transitionState = .open
//                }
//                .onDisappear {
//                    appModel.transitionState = .closed
//                }
//        }
//        .immersionStyle(selection: .constant(.mixed), in: .mixed)
//        
//        ImmersiveSpace(id: "box") {
//            ObjectBox()
//                .environment(appModel)
//                .offset(z: -oneMeter)
//                .offset(x: 0, y: -oneMeter)
//                .onAppear {
//                    appModel.transitionState = .open
//                }
//                .onDisappear {
//                    appModel.transitionState = .closed
//                }
//        }
//        .immersionStyle(selection: .constant(.mixed), in: .mixed)
//        
//        ImmersiveSpace(id: "cylinder") {
//            ObjectCylinder()
//                .environment(appModel)
//                .offset(z: -oneMeter)
//                .offset(x: 0, y: -oneMeter)
//                .onAppear {
//                    appModel.transitionState = .open
//                }
//                .onDisappear {
//                    appModel.transitionState = .closed
//                }
//        }
//        .immersionStyle(selection: .constant(.mixed), in: .mixed)
//        
//        ImmersiveSpace(id: "cone") {
//            ObjectCone()
//                .environment(appModel)
//                .offset(z: -oneMeter)
//                .offset(x: 0, y: -oneMeter)
//                .onAppear {
//                    appModel.transitionState = .open
//                }
//                .onDisappear {
//                    appModel.transitionState = .closed
//                }
//        }
//        .immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}

