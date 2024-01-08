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
            VStack(spacing: 0){
                
                CustomHeaderBack(title: "LV BEREICHE"){
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
                
                List(objektVM.areaList, id: \.id){ area in
                    
                    NavigationLink(destination: ListOfServicesSpaceView().environmentObject(objektVM)){
                        VStack(alignment: .leading){
                            Text(area.title)
                                .font(.custom(FontStrings.appFontBlack, size: 22))
                                .foregroundStyle(Color.appBlue)
                            
                            Text("Anzahl der Räume (Spaces)")
                                .font(.custom(FontStrings.appFontBold, size: 16))
                                .foregroundStyle(Color.appBlue)
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                objektVM.deleteArea(with: area.id ?? "")
                            }
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                    }
                    
                }
                .background(Color.appBackground)
                .scrollContentBackground(.hidden)
                .onAppear{
                    objektVM.fetchArea(objektID: objektVM.objektID)
                }
                .onDisappear{
                    objektVM.cancelAreaListener()
                }
                
            }
            

            
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ListOfServicesAreaView()
}
