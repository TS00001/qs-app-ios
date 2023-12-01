//
//  ObjektDataComponente.swift
//  QS_APP
//
//  Created by Tom Salih on 01.12.23.
//

import SwiftUI

struct ObjektDataItem: View {
    
    //MARK: VARIABLES
    let title: String
    let content: String
    
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Values.middlePadding)
                    .foregroundStyle(Color.appBackground)
                    .font(.custom(FontStrings.appFontBold, size: Values.appSubtitle))
                    .bold()
                
                Text(content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, Values.middlePadding)
                    .foregroundStyle(Color.appBackground)
                    .font(.footnote)
                    .bold()
            }
            .padding(.leading, Values.middlePadding)
        }
        .background(Color.appBlue )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
}

#Preview {
    ObjektDataItem(title: "Mail", content: "info@mustermann.de")
}
