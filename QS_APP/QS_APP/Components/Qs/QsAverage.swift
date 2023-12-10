//
//  QsAverage.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct QsAverage: View {
    var body: some View {
        
        @State var rating = 3
        
        VStack(spacing: 0){
            HStack{
                Text("QS AUSWERTUNG VOM:")
                    .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
                    .foregroundStyle(Color.appBackground)
                
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Values.majorPadding)
                    
                
                Text("12.12.2023")
                    .font(.custom(FontStrings.appFontBlack, size: Values.appSubtitle))
                    .foregroundStyle(Color.appBackground)
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
    QsAverage()
}
