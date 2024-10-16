//
//  Bundle-Decodable.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import Foundation

#if DEBUG
extension Bundle {
    func decodeFile<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in the bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from the bundle")
        }
        
        return loaded
    }
}
#endif
