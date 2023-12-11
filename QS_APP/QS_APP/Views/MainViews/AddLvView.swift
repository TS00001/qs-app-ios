//
//  AddLvView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct AddLvView: View {
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: "LV BEREICH ERSTELLEN"){
                    
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
                ZStack{
                    ScrollView{
                        LvItem(title: "Erdgeschoss")
                        LvItem(title: "Treppenhaus")
                        LvItem(title: "1. Obergeschoss")
                    }
                    .vstackModi()
                    
                    
                    VStack{
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: Values.plus)
                                .font(.custom(FontStrings.appFontBold, size: 40))
                                .bold()
                                .foregroundStyle(.appBackground)
                                .frame(width: 30, height: 30)
                                .padding(Values.middlePadding)
                                .background(.appBlue)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: Values.minorShadow)
                        })
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomTrailing)
                    .padding(.trailing, 30)
                    .padding(.bottom, 30)
                    
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddLvView()
}
