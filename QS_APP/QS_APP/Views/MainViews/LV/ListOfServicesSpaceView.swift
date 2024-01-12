//
//  ListOfServicesSpaceView.swift
//  QS_APP
//
//  Created by Tom Salih on 12.12.23.
//

import SwiftUI

struct ListOfServicesSpaceView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var objekt: Objekt
    var areaID: String
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: objekt.name.uppercased()){
                    
                    Button(action: {
                        objektVM.showAddSpaceSheet.toggle()
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $objektVM.showAddSpaceSheet){
                    AddSpaceSheet(areaID: areaID).environmentObject(objektVM)
                        .presentationDetents([.height(350)])
                }
                .background(.appBackground)
                
                .onAppear{
                    objektVM.fetchSpace(areaID: areaID)
                }
                .onDisappear{
                    objektVM.cancelSpaceListener()
                }

                List(objektVM.spaceList, id: \.id){ space in
                
                    VStack(alignment: .leading) {
                        Text(space.title)
                            .font(.custom(FontStrings.appFontBlack, size: 22))
                            .foregroundStyle(Color.appBlue)
                        
                        Text("Bemerkung:")
                            .font(.custom(FontStrings.appFontBold, size: 16))
                            .foregroundStyle(Color.appBlue)
                            .opacity(0.7)
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                objektVM.deleteSpace(with: String(space.id ?? ""))
                            }
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                    }
                    
                }
                .background(Color.appBackground)
                .scrollContentBackground(.hidden)
                
//                Text("Füge einen neuen Raum hinzu, indem du auf das + drückst.")
//                    .multilineTextAlignment(.center)
//                    .frame(maxWidth: .infinity, alignment: .center)
//                    .padding(.horizontal, 40)
//                    .padding(.top, 250)
//                    .font(.custom(FontStrings.appFontBlack, size: 22))
//                    .foregroundStyle(Color.appBlue)
//
                Spacer()
                
               
            }
            .background(.appBackground)
            
        }
        .navigationBarBackButtonHidden(true)
        
//        NavigationStack{
//            VStack(spacing: 0){
//                
//                CustomHeaderBack(title: objektVM.objekt.name.uppercased()){
//                    Button(action: {
//                        
//                    }, label: {
//                        CustomHeaderIcon(icon: Values.editIcon)
//                    })
//                }
//                List(objektVM.spaceList, id: \.id){ space in
//                    
//                    VStack(alignment: .leading){
//                        Text(space.title)
//                            .font(.custom(FontStrings.appFontBlack, size: 22))
//                            .foregroundStyle(Color.appBlue)
//                        
//                        Text("Anzahl der Räume (Spaces)")
//                            .font(.custom(FontStrings.appFontBold, size: 16))
//                            .foregroundStyle(Color.appBlue)
//                    }
//                    .swipeActions {
//                        Button(role: .destructive) {
//                            withAnimation {
//                                objektVM.deleteSpace(with: space.id ?? "")
//                            }
//                        } label: {
//                            Label("Löschen", systemImage: "trash")
//                        }
//                    }
//                    
//                }
//                .background(Color.appBackground)
//                .scrollContentBackground(.hidden)
////                .onAppear{
////                    objektVM.fetchSpace(areaID: objektVM.areaID)
////                }
////                .onDisappear{
////                    objektVM.cancelSpaceListener()
////                }
//            }
//        }
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ListOfServicesSpaceView(objekt: Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: ""), mail: ""), areaID: "")
}
