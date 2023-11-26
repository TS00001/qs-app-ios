//
//  StandardButton.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct StandardButton: View {
    
    let label: String
    let color: Color
    let fontColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(label)
                .font(.custom(FontStrings.appFontBold, size: Values.appSubtitle))
                .bold()
                .foregroundStyle(fontColor)
                .frame(maxWidth: .infinity)
                .padding(Values.middlePadding)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: Values.minorShadow)

        })
        
    }
}

#Preview {
    StandardButton(label: "Speichern", color: .appBackground, fontColor: Color.appBlue) { }
}
