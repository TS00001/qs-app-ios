//
//  ObjektView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct ObjektView: View {
    
    @StateObject private var objektVM = ObjektViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack {
                CustomHeader(title: "OBJEKTE"){
                    Button(action: {
                        objektVM.showAddObjektSheet = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $objektVM.showAddObjektSheet) {
                    AddObjektSheet(showAddObjektSheet: $objektVM.showAddObjektSheet)
                        .environmentObject(objektVM)
                        .presentationDetents([.height(550)])
                }
                List(objektVM.objektList, id: \.id){ objekt in
                    NavigationLink(destination: ObjektDetailView().environmentObject(objektVM)){
                        HStack{
                            VStack{
                                Image(systemName: Values.objektIcon)
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundStyle(Color.appBlue)
                            }
                            VStack(alignment: .leading){
                                Text(objekt.name)
                                    .font(.custom(FontStrings.appFontBlack, size: 22))
                                    .foregroundStyle(Color.appBlue)
                                HStack{
                                    Text(objekt.adress.street)
                                        .font(.custom(FontStrings.appFontBold, size: 16))
                                        .foregroundStyle(Color.appBlue)
                                    Text(objekt.adress.housenumber)
                                        .font(.custom(FontStrings.appFontBold, size: 16))
                                        .foregroundStyle(Color.appBlue)
                                }
                            }
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                objektVM.deleteObjekt(with: objekt.id ?? "")
                            }
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        objektVM.objekt = objekt
                    })
                }
                .background(Color.appBackground)
                .scrollContentBackground(.hidden)
                .onAppear{
                    objektVM.fetchObjekt()
                }
                .onDisappear{
                    objektVM.cancelListener()
                }
            }
            .background(Color.appBackground)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ObjektView()
}
