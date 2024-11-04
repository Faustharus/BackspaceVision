//
//  AppModel.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 17/10/2024.
//

import SwiftUI

@MainActor
@Observable
class AppModel {
    enum TransitionState {
        case open, inTransition, closed
    }
    enum Shapes: String, CaseIterable {
        case sphere, box, cylinder, cone
    }
    
    var objects = [Objects]()
    var transitionState = TransitionState.closed
    
    init() {}
    
    func downloadJSONData() async {
        
        guard let url = URL(string: "http://sample-json-backspace.s3-website.eu-west-3.amazonaws.com/sample.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Server error: \(response)")
                return
            }
            
            let jsonDecoder = JSONDecoder()
            objects = try jsonDecoder.decode([Objects].self, from: data)
            
        } catch {
            print("Error decoding JSON Data: \(error)")
        }
    }
    
}
