//
//  Area.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

struct Area: Codable {
    var id = UUID().uuidString
    
    var title: String
    var space: [Space]
}
