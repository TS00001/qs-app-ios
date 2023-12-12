//
//  ListOfServicesAreaView.swift
//  QS_APP
//
//  Created by Tom Salih on 11.12.23.
//

import SwiftUI

struct ListOfServicesAreaView: View {
    var body: some View {
        
        NavigationStack{
            
            CustomHeaderBack(title: "LV BEREICHE"){
                Button(action: {
                    
                }, label: {
                    CustomHeaderIcon(icon: Values.editIcon)
                })
            }
            ScrollView{
                NavigationLink(destination: ListOfServicesSpaceView()){
                    LvItem(title: "Erdgeschoss")
                }
                
                LvItem(title: "Treppenhaus")
                LvItem(title: "1. Erdgeschoss")
            }
            .background(.appBackground)
            
            .vstackModi()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ListOfServicesAreaView()
}
