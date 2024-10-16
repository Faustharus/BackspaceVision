//
//  ObjectBox.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import SwiftUI

struct ObjectBox: View {
    var object: Objects
    
    var body: some View {
        VStack {
            Text("\(object.name)")
            ShowObjectButton(object: object)
        }
    }
}

#Preview {
    ObjectBox(object: .localJSONData[1])
}
