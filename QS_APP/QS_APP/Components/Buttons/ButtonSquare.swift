//
//  ButtonSquare.swift
//  QS_APP
//
//  Created by Tom Salih on 22.11.23.
//

import SwiftUI

struct ButtonSquare: View {
    
    let icon: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            
            Image(systemName: icon)
                .resizable()
                .frame(width: Values.squareButtonFrame, height: Values.squareButtonFrame)
                .padding(Values.squareButtoninnerPadding)
                .foregroundColor(.appBackground)
                .background(Color.appBlue)
                .cornerRadius(Values.majorRadius)
        }
        .shadow(radius: 1)
    }
   
    
}

#Preview {
    ButtonSquare(icon: "calendar") { }
}
