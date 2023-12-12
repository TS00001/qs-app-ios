//
//  AddAreaView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct AddAreaView: View {
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: "LV BEREICH ERSTELLEN"){
                    
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                
                Text("Füge einen neuen Bereich hinzu, indem du auf das + drückst.")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 40)
                    .padding(.top, 250)
                    .font(.custom(FontStrings.appFontBlack, size: 22))
                    .foregroundStyle(Color.appBlue)
                
                Spacer()
            }
            .background(.appBackground)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddAreaView()
}
