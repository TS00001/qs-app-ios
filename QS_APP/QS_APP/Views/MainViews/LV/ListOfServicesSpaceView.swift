//
//  ListOfServicesSpaceView.swift
//  QS_APP
//
//  Created by Tom Salih on 12.12.23.
//

import SwiftUI

struct ListOfServicesSpaceView: View {
    var body: some View {
        NavigationStack{
            
            CustomHeaderBack(title: "LV RÄUME"){
                Button(action: {
                    
                }, label: {
                    CustomHeaderIcon(icon: Values.editIcon)
                })
            }
            ScrollView{
//                NavigationLink(destination: ListOfServicesSpaceView()){
//                    
//                }
                LvItem(title: "Eingangshalle")
                LvItem(title: "Putzraum")
                LvItem(title: "Sanitäranlagen")
                LvItem(title: "Büros")
            }
            .background(.appBackground)
            
            .vstackModi()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ListOfServicesSpaceView()
}
