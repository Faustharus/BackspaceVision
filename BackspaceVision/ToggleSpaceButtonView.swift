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
    
    let itemRawValue: String
    
    var body: some View {
//        ForEach(AppModel.Shapes.allCases, id: \.self) { item in
            Button {
                Task { @MainActor in
                    switch appModel.transitionState {
                    case .open:
                        appModel.transitionState = .inTransition
                        await dismissImmersiveSpace()
                        
                    case .closed:
                        appModel.transitionState = .inTransition
                        switch await openImmersiveSpace(id: itemRawValue) {
                        case .opened:
                            break
                            
                        case .userCancelled, .error:
                            fallthrough
                            
                        @unknown default:
                            appModel.transitionState = .closed
                        }
                        
                    case .inTransition:
                        break
                    }
                }
            } label: {
                Text(appModel.transitionState == .open ? "Hide \(itemRawValue.capitalized) " : "Show \(itemRawValue.capitalized)")
            }
            .disabled(appModel.transitionState == .inTransition)
            .animation(.none, value: 0)
            .fontWeight(.semibold)
//        }
    }
}
