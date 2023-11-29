//
//  Adress.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

struct Adress: Codable{
    var id = UUID().uuidString
    
    var street: String
    var postalCode: String
    var city: String
}
