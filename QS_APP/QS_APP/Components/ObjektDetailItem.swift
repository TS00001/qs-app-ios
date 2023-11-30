//
//  ObjektDetailItem.swift
//  QS_APP
//
//  Created by Tom Salih on 30.11.23.
//

import SwiftUI

struct ObjektDetailItem: View {
    
    //MARK: VARIABLES
    let title: String
    let street: String
    let postalCode: String
    let city: String
    
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Values.middlePadding)
                    .foregroundStyle(Color.appBackground)
                    .font(.custom(FontStrings.appFontBold, size: Values.appSubtitle))
                    .bold()
                
                Text("\(street), \(postalCode) \(city)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, Values.middlePadding)
                    .foregroundStyle(Color.appBackground)
                    .font(.footnote)
                    .bold()
            }
            .padding(.leading, Values.middlePadding)
                        
//            Image(systemName: Values.arrowRight)
//                .font(.title)
//                .bold()
//                .foregroundColor(.appBlue)
//                .padding(.trailing, Values.middlePadding)
        }
        .background(Color.appBlue )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
}

#Preview {
    ObjektDetailItem(title: "Musterfirma GmbH", street: "Musterstrasse 112", postalCode: "72070", city: "Musterstadt")
}
