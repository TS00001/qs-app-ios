//
//  Objekt.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

struct Objekt: Codable{
    
    //TODO: schauen wie ich DucumentId verwenden kann
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
    var cleaningDayMon: Bool?
    var cleaningDayTue: Bool?
    var cleaningDayWed: Bool?
    var cleaningDayThu: Bool?
    var cleaningDayFri: Bool?
}

