//
//  CalculatorViewModel.swift
//  QS_APP
//
//  Created by Tom Salih on 04.01.24.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    
    
    @Published var quadratmeter: String = ""
    @Published var roomDescription: String = ""
    @Published var selectedMultiplier: Double = 1.0
    @Published var results: [Result] = []
    @Published var showCalculatorSheet = false
    
    let multipliers = [200.0, 140.0, 80.0, 180.0]
    
    
    
    
    func calculateResult() {
        guard let quadratmeter = Double(quadratmeter), !roomDescription.isEmpty else {
            return
        }
        
        let resultValue = (quadratmeter / selectedMultiplier)
        let result = Result(roomDescription: roomDescription, quadratmeter: quadratmeter, value: resultValue)
        results.append(result)
    }
    
    
    func iconForMultiplier(_ multiplier: Double) -> String {
        
        switch multiplier {
        case 200.0:
            return "table.furniture"
        case 140.0:
            return "figure.stairs"
        case 80.0:
            return "shower.handheld"
        case 180.0:
            return "chair.lounge"
        default:
            return ""
        }
    }
    
    func formattedResult(_ value: Double? = nil) -> String {
        if let resultValue = value {
            return String(format: "%.2f", resultValue)
        } else {
            return "0.00"
        }
    }
}
