//
//  ListOfServicesSpaceView.swift
//  QS_APP
//
//  Created by Tom Salih on 12.12.23.
//

import SwiftUI

struct ListOfServicesSpaceView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0){
                CustomHeaderBack(title: "LV RÄUME"){
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.editIcon)
                    })
                }
            }
            
            List(objektVM.spaceList, id: \.id){ space in
                NavigationLink(destination: ListOfServicesSpaceView()){
                    VStack(alignment: .leading){
                        Text(space.title)
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
                            objektVM.deleteSpace(with: space.id ?? "")
                        }
                    } label: {
                        Label("Löschen", systemImage: "trash")
                    }
                }
                
            }
            .background(Color.appBackground)
            .scrollContentBackground(.hidden)
            .onAppear{
//                objektVM.fetchArea(objektID: objektVM.objektID)
            }
            
            
//            ScrollView{
//                LvItem(title: "Eingangshalle")
//                LvItem(title: "Putzraum")
//                LvItem(title: "Sanitäranlagen")
//                LvItem(title: "Büros")
//            }
//            .background(.appBackground)
//            
//            .vstackModi()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ListOfServicesSpaceView()
}
