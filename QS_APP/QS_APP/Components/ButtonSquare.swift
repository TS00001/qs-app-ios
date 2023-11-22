//
//  ButtonSquare.swift
//  QS_APP
//
//  Created by Tom Salih on 22.11.23.
//

import SwiftUI

struct ButtonSquare: View {
    
    var body: some View {
        Button(action: action) {
            
            Image(systemName: icon)
                .resizable()
                .frame(width: 75, height: 75)
                .padding(40)
                .foregroundColor(.appBackground)
                .background(Color.appBlue)
                .cornerRadius(10)
        }
        .shadow(radius: 1)
    }
    
    let icon: String
    let action: () -> Void
    
}

#Preview {
    ButtonSquare(icon: "calendar") { }
}
