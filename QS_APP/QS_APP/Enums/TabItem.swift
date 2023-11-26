//
//  TabItem.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import Foundation

enum TabItem {
    
    case home, objekte, rechner, einstellungen
    
    var title: String {
        switch self {
        case .home: return "Start"
        case .objekte: return "Objekte"
        case .rechner: return "Rechner"
        case .einstellungen: return "Settings"
        }
    }
    
    // Hier werden die Icons für die TabBar definiert
    var icon: String {
        switch self {
        case .home: return Values.homeIcon
        case .objekte: return Values.objektIcon
        case .rechner: return Values.calculatorIcon
        case .einstellungen: return Values.settingsIcon
        }
    }
}
