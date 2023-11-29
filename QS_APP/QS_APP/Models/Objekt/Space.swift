//
//  Space.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

struct Space: Codable{
    var id = UUID().uuidString
    
    var title: String
    var comment: String?
    var rating: Int?
}
