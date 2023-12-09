//
//  IconComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 07.12.23.
//

import SwiftUI

struct IconComponente: View {
    
    //MARK: VARIABLES
    let icon: String
    
    var body: some View {
        
        Image(systemName: icon)
            .resizable()
            .frame(width: 32, height: 32)
            .bold()
            .foregroundColor(.appBlue)
    }
}

#Preview {
    IconComponente(icon: Values.plus)
}
