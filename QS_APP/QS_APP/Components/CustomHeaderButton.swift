//
//  CustomHeaderButton.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct CustomHeaderButton: ViewModifier {
    let icon: String
    let action: () -> Void

    
    func body(content: Content) -> some View {
        
        Button(action: {
            action()
        }, label: {
            Image(systemName: icon)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, Values.middlePadding)
                .bold()
                .foregroundColor(.appBlue)
        })
        
    }
    
}

extension View {
    func customHeaderButton(icon: String, action: @escaping () -> Void) -> some View{
        modifier(CustomHeaderButton(icon: icon, action: action))
    }
}
