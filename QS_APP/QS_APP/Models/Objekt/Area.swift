//
//  Area.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation
import FirebaseFirestoreSwift

struct Area: Codable{
    @DocumentID var id: String?
    
    var objektID: String
    var title: String
    var space: [Space]?
}
