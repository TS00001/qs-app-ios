//
//  ListOfServicesAreaView.swift
//  QS_APP
//
//  Created by Tom Salih on 11.12.23.
//

import SwiftUI

struct ListOfServicesAreaView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var body: some View {
        
        NavigationStack{
            
            CustomHeaderBack(title: "LV BEREICHE"){
                Button(action: {
                    
                }, label: {
                    CustomHeaderIcon(icon: Values.editIcon)
                })
            }
            
            
            ScrollView{
                NavigationLink(destination: ListOfServicesSpaceView().environmentObject(objektVM)){
                    ForEach(objektVM.areaList, id: \.id){ area in
                        LvItem(title: area.title)
                            .padding(.horizontal, Values.middlePadding)
                            .padding(.bottom, Values.middlePadding)
                    }
                }
                .navigationBarBackButtonHidden(true)
                
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
