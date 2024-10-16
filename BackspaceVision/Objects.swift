//
//  Objects.swift
//  BackspaceVision
//
//  Created by Damien Chailloleau on 16/10/2024.
//

import Foundation

struct Objects: Identifiable, Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case id, name, shape, color
    }
    
    var id: String
    var name: String
    var shape: String
    var color: String
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.shape = try container.decode(String.self, forKey: .shape)
        self.color = try container.decode(String.self, forKey: .color)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.shape, forKey: .shape)
        try container.encode(self.color, forKey: .color)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func ==(lhs: Objects, rhs: Objects) -> Bool {
        lhs.id == rhs.id
    }
}

extension Objects {
    static var localJSONData: [Objects] {
        let previewDataURL = Bundle.main.url(forResource: "cubes", withExtension: "json")!
        guard let data = try? Data(contentsOf: previewDataURL) else {
            return []
        }
        
        let decoder = JSONDecoder()
        
        let objectsResponse = try! decoder.decode([Objects].self, from: data)
        return objectsResponse
    }
    
    static var preview: [Objects] {
        [
//            .init(id: UUID().uuidString, name: "Object 1", shape: "sphere", color: "green"),
//            .init(id: UUID().uuidString, name: "Object 2", shape: "box", color: "blue"),
//            .init(id: UUID().uuidString, name: "Object 3", shape: "cylinder", color: "yellow"),
//            .init(id: UUID().uuidString, name: "Object 4", shape: "cone", color: "red")
        ]
    }
}
