//
//  FormItem.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct FormItemStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, Values.middlePadding)
            .frame(height: 30)
            .padding(.vertical, Values.middlePadding)
            .background(Color.appBackground)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
}

extension View {
    func formItemStyle(with: Color) -> some View {
        modifier(FormItemStyle())
    }
}
