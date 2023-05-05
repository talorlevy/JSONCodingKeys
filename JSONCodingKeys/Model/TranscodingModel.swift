//
//  TranscodingModel.swift
//  Lokesh - Task 4
//
//  Created by Talor Levy on 2/12/23.
//

import Foundation

struct TranscodingModel: Codable {
    var transcodingId: String?
    var height: Int?
    var width: Int?
}

extension TranscodingModel {
    enum CodingKeys: String, CodingKey {
        case transcodingId = "id"
        case height = "height"
        case width = "width"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.transcodingId = try container.decodeIfPresent(String.self, forKey: .transcodingId)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.transcodingId, forKey: .transcodingId)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.width, forKey: .width)
    }
}
