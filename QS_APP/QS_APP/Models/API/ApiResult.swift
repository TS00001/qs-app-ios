//
//  ApiResult.swift
//  QS_APP
//
//  Created by Tom Salih on 11.12.23.
//

import Foundation

struct ApiResult: Codable{
    
    var country: String?
    var state: String?
    var city: String?
    var street: String?
    var housenumber: String?
    var postcode: String?
    var postcodes: [String]?
    var lon: Double?
    var lat: Double?
    var formatted: String?
    var address_line1: String?
    var address_line2: String?
    var place_id: String?
}
