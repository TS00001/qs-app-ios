//
//  CustomListItem.swift
//  QS_APP
//
//  Created by Tom Salih on 01.12.23.
//

import SwiftUI

struct CustomListItem<Content: View>: View {
    
    var body: some View {
        VStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, Values.middlePadding)
                .foregroundStyle(Color.appBackground)
                .font(.custom(FontStrings.appFontBold, size: Values.appSubtitle))
                .bold()
            
            content()
        }
        .frame(height: 80)
        .background(Color.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
        
    }
    
    //MARK: VARIABLES
    let title: String
    
    @ViewBuilder var content: () -> Content
}

#Preview {
    CustomListItem(title: "Adresse") {}
}
