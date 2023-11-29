//
//  Interval.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

enum Interval: CaseIterable{
    case one, two, four
    
    var intervalString: String{
        
        switch self {
        case .one:
            "1 Wochen"
        case .two:
            "2 Wochen"
        case .four:
            "4 Wochen"
        }
    }
}
