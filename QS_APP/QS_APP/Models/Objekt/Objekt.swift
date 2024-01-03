//
//  Objekt.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation
import FirebaseFirestoreSwift

struct Objekt: Codable, Identifiable{
    @DocumentID var id: String?
    
    var name: String
    var adress: Adress
    var mail: String
    var contactPerson: String?
    var cleaningPerson: String?
    var objectManager: String?
    var interval: Int?
//    var listOfServices: [Area]?
    var qualityAssurance: [QualityAssurance]?
    var cleaningDayMon = false
    var cleaningDayTue = false
    var cleaningDayWed = false
    var cleaningDayThu = false
    var cleaningDayFri = false
}

