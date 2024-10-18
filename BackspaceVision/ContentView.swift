//
//  ContentView.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(AppModel.self) private var appModel
    @Environment(\.openWindow) var openWindow
    
    let columns = [
        GridItem(.adaptive(minimum: 500))
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: columns, spacing: 50) {
                ForEach(appModel.objects) { object in
                    VStack(spacing: 5) {
                        ToggleSpaceButtonView(itemRawValue: object.shape)
                        
                        Spacer().frame(height: 20)
                        
                        ObjectRowView(object: object).frame(depth: 0, alignment: .front)
                    }
                    .padding(.vertical, 15)
                }
            }
            .padding(.all, 15)
            .onAppear {
                Task {
                    await appModel.downloadJSONData()
                }
            }
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
