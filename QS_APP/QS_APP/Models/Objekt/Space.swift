//
//  Space.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation
import FirebaseFirestoreSwift

struct Space: Codable, Identifiable{
    @DocumentID var id: String?
    
    var areaID: String
    var title: String
    var rating: Int?
    var comment: String?
    var cleaningDayMon = false
    var cleaningDayTue = false
    var cleaningDayWed = false
    var cleaningDayThu = false
    var cleaningDayFri = false
}
