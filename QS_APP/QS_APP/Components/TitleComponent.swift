//
//  TitleComponent.swift
//  QS_APP
//
//  Created by Tom Salih on 07.12.23.
//

import SwiftUI

struct TitleComponent<Content: View>: View {
    var body: some View {
        HStack(spacing: 0){
            Text(title)
                .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
                .bold()
                .foregroundStyle(Color.appBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            content()
                
        }
        
    }
    
    let title: String
    
    @ViewBuilder var content: () -> Content
}

#Preview {
    TitleComponent(title: "TITLE") { }
}
