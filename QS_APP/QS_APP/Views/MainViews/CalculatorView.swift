//
//  CalculatorView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        ZStack{
            AppBackground(color: .appBackground)
            
            VStack(spacing: 0){
                CustomHeader(title: "RECHNER"){
                    CustomHeaderIcon(icon: Values.plus)
                }
                
                ScrollView{
                    
                }
            }
        }
    }
}

#Preview {
    CalculatorView()
}
