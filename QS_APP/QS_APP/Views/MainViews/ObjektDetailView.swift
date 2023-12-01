//
//  ObjektDetailView.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct ObjektDetailView: View {
    var body: some View {
        ZStack{
            AppBackground(color: .appBackground)
            
            VStack(spacing: 0){
                CustomHeader(title: "OBJEKTNAME"){
                    
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.qsIcon)
                    })
                }
                Spacer()

                ScrollView{
                    AdressItem(title: "Adresse", street: "Musterstraße 112", postalCode: "72072", city: "Musterdtadt")
                     .padding(.top, Values.minorPadding)
                    
                    
                    
                    
                }
                .padding(.horizontal, Values.middlePadding)
                
            }
        }
    }
}


#Preview {
    ObjektDetailView()
}
