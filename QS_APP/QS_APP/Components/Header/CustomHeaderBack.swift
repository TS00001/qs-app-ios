//
//  CustomHeaderBack.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct CustomHeaderBack<Content: View>: View {
    
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        HStack(spacing: 0){
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: Values.backIcon)
                    .resizable()
                    .frame(width: 22, height: 22)
                    .padding(.leading, Values.middlePadding)
                    .bold()
                    .foregroundColor(.appBlue)
            })
            
            Text(title)
                .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
                .bold()
                .foregroundStyle(Color.appBlue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(Values.middlePadding)
            
            content()
        }
        .background(Color.appBackground)
    }
    
    let title: String
    
    @ViewBuilder var content: () -> Content
}

#Preview {
    CustomHeaderBack(title: "TEST"){
        
    }
}

