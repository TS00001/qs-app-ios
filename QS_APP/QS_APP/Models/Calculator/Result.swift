//
//  Result.swift
//  QS_APP
//
//  Created by Tom Salih on 07.01.24.
//

import Foundation
import FirebaseFirestoreSwift

struct Result: Codable, Identifiable {
    @DocumentID var id: String?
    
    var roomDescription: String
    var quadratmeter: Double
    var hours: Double
}
