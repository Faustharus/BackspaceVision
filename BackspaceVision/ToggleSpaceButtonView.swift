//
//  ToggleSpaceButtonView.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 18/10/2024.
//

import SwiftUI

struct ToggleSpaceButtonView: View {
    
    @Environment(AppModel.self) private var appModel
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @Environment(\.openWindow) var openWindow
    @Environment(\.dismissWindow) var dismissWindow
    
//    let shapeName: String
    let object: Objects
    
    var body: some View {
        Button {
            Task { @MainActor in
                switch appModel.transitionState {
                case .open:
                    appModel.transitionState = .inTransition
                    dismissWindow()
                    
                case .closed:
                    appModel.transitionState = .inTransition
                    openWindow(value: object)
                    
                case .inTransition:
                    break
                    
                @unknown default:
                    appModel.transitionState = .closed
                }
//                switch appModel.transitionState {
//                case .open:
//                    appModel.transitionState = .inTransition
//                    await dismissImmersiveSpace()
//                    
//                case .closed:
//                    appModel.transitionState = .inTransition
//                    switch await openImmersiveSpace(id: shapeName) {
//                    case .opened:
//                        break
//                        
//                    case .userCancelled, .error:
//                        fallthrough
//                        
//                    @unknown default:
//                        appModel.transitionState = .closed
//                    }
//                    
//                case .inTransition:
//                    break
//                }
            }
        } label: {
            Text(appModel.transitionState == .open ? "Hide \(object.name.capitalized) " : "Show \(object.name.capitalized)")
                .font(.largeTitle)
        }
        .disabled(appModel.transitionState == .inTransition)
        .animation(.none, value: 0)
        .fontWeight(.semibold)
    }
}
