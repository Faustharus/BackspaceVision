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
    @Environment(\.openWindow) var openWindow
    
    @State private var objects = [Objects]()
    
    let columns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(objects) { object in
                Button {
                    openWindow(id: object.shape)
                } label: {
                    HStack {
                        Text("\(object.shape.capitalized)")
                        ObjectRowView(object: object).frame(depth: 0)
                    }
                    .frame(height: 150)
                }
            }
        }
        .onAppear {
            downloadJSONData()
        }
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

extension ContentView {
    
    func downloadJSONData() {
        guard let url = URL(string: "http://sample-json-backspace.s3-website.eu-west-3.amazonaws.com/sample.json") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, res, err in
            if let err = err {
                print("Error detected: \(err.localizedDescription)")
            } else if let data = data {
                do {
                    let jsonDecoder = JSONDecoder()
                    
                    let allObjects = try jsonDecoder.decode([Objects].self, from: data)
                    dump("\(allObjects)")
                    for obj in allObjects {
                        objects.append(obj)
                    }
                } catch {
                    print("Error decoding JSON Data: \(error)")
                }
            }
        }
        
        task.resume()
    }
    
}
