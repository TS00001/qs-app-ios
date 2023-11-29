//
//  QualityAssurance.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

struct QualityAssurance: Codable {
    var id = UUID().uuidString
    
    var qs: [Area]
}
