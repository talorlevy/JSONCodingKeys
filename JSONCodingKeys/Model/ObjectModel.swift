//
//  PostModel.swift
//  JsonDataExample
//
//  Created by Talor Levy on 2/8/23.
//

import Foundation


struct ObjectModel: Codable {
    var title: String?
    var transcodings: [TranscodingModel]?
}
