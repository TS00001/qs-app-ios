//
//  Offer.swift
//  QS_APP
//
//  Created by Tom Salih on 07.01.24.
//

import Foundation
import FirebaseFirestoreSwift

struct Offer: Codable, Identifiable {
    @DocumentID var id: String?
    
    var resultID: String
    var results: [Result]?
    var totalHours: Double
    var totalQuadratmeter: Double
}
