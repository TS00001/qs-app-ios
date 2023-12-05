//
//  ObjektDetailItem.swift
//  QS_APP
//
//  Created by Tom Salih on 30.11.23.
//

import SwiftUI

struct AdressItem: View {
    
    //MARK: VARIABLES
    let title: String
    let street: String
    let postalCode: String
    let city: String
    
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                Text(title)
                    .itemTitleModi()

                Text("\(street), \(postalCode) \(city)")
                    .itemSubtitleModi()
            }
            .padding(.leading, Values.middlePadding)
        }
        .background(Color.appBlue )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: Values.minorShadow)
    }
}

#Preview {
    AdressItem(title: "Musterfirma GmbH", street: "Musterstrasse 112", postalCode: "72070", city: "Musterstadt")
}
