//
//  ObjektView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct ObjektView: View {
    
    @StateObject private var objektVM = ObjektViewModel()
    
    //MARK: VRIABLES
    @State var showAddObjektSheet = false
    
    var body: some View {
        
        NavigationStack{
            VStack {
                CustomHeader(title: "OBJEKTE"){
                    Button(action: {
                        showAddObjektSheet = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $showAddObjektSheet) {
                    AddObjektSheet(showAddObjektSheet: $showAddObjektSheet)
                        .environmentObject(objektVM)
                }
                
                VStack{
                    ScrollView{
                        ForEach(objektVM.objektList, id: \.id){ objekt in
                            NavigationLink(destination: ObjektDetailView()){
                                ObjektAndQsListItem(icon: Values.objektIcon, title: objekt.name, street: objekt.adress.street, postalCode: objekt.adress.postalCode, city: objekt.adress.city)
                            }
                        }
                        .padding(.horizontal, Values.middlePadding)
                    }
                }
            }
        }
    }
}

#Preview {
    ObjektView()
}
