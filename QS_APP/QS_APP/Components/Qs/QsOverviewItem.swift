//
//  QsOverviewItem.swift
//  QS_APP
//
//  Created by Tom Salih on 27.11.23.
//

import SwiftUI

struct QsOverviewItem: View {

    @Binding var rating: Int
    
    var body: some View {
        
        VStack(spacing: 0){
            HStack{
                Text("QS AUSWERTUNG GESAMT")
                    .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
                    .foregroundStyle(Color.appBackground)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Values.majorPadding)
                    
            }
            .padding(.horizontal, Values.middlePadding)
            
           
            
            
            RatingView(rating: $rating)
                .padding(.horizontal, Values.middlePadding)
                .padding(.top, Values.middlePadding)
                .padding(.bottom, Values.majorPadding)
            
            
        }
        //TODO: Modifier implementieren
        .background(Color.appBlue)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    QsOverviewItem(rating: .constant(3))
}
