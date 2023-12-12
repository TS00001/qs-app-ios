//
//  QsView.swift
//  QS_APP
//
//  Created by Tom Salih on 09.12.23.
//

import SwiftUI

struct QsHistoryView: View {
    
    @Binding var rating: Int
    
    var body: some View {
        VStack{
            CustomHeader(title: "QS DURCHSCHNITT"){
                SmallRatingView(rating: .constant(4))
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .padding(.trailing, Values.middlePadding)
        .padding(.top, Values.middlePadding)
        .background(.appBackground)
//        .vstackModi()
        
        
        NavigationStack{
            ScrollView{
                TitleComponent(title: "QS VERLAUF"){
                    
                }
                
                ForEach(1...3, id: \.self){ item in
                    QsAverage()
                        .padding(.bottom, Values.middlePadding)
                }
            }
            .vstackModi()
            
            
        }
//        .frame(maxWidth: .infinity)
//        .vstackModi()
    }
}

#Preview {
    QsHistoryView(rating: .constant(3))
}
