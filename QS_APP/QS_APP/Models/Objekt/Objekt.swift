//
//  Objekt.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

struct Objekt: Codable{
    var id = UUID().uuidString
    
    var name: String
    var adress: Adress
    var mail: String
    var contactPerson: String?
    var cleaningPerson: String?
    var objectManager: String?
    var interval: String?
    var listOfServices: [Area]?
    var qualityAssurance: [QualityAssurance]?
}

