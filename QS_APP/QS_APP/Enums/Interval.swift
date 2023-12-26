//
//  Interval.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation

enum Interval: CaseIterable{
    case one, two, four
    
    var intervalString: Int{
        
        switch self {
        case .one:
            1
        case .two:
            2
        case .four:
            3
        }
    }
}
