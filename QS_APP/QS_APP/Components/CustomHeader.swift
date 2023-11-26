//
//  CustomHeader.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct CustomHeader<Content: View>: View {
    var body: some View {
        HStack(spacing: Values.middlePadding){
            Text(title)
                .font(.custom(FontStrings.appFontBlack, size: Values.appTitle))
                .bold()
                .foregroundStyle(Color.appBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(Values.middlePadding)
            
            content()
        }
    }
    
    
    let title: String
    
    @ViewBuilder var content: () -> Content
}

#Preview {
    CustomHeader(title: "Test") { }
}
