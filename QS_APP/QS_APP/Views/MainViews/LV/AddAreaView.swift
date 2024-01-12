//
//  AddAreaView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct AddAreaView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var objekt: Objekt
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: objekt.name.uppercased()){
                    
                    Button(action: {
                        objektVM.showAddAreaSheet = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $objektVM.showAddAreaSheet){
                    AddAreaSheet(objektID: objekt.id ?? "")
                        .presentationDetents([.height(350)])
                        .environmentObject(objektVM)
                }
                .background(.appBackground)
                .onAppear{
                    objektVM.fetchArea(objektID: objekt.id ?? "")
                }
                .onDisappear{
                    objektVM.cancelAreaListener()
                }
                
                List(objektVM.areaList, id: \.id){ area in
                    NavigationLink(destination: AddSpaceView(areaID: area.id ?? "", objektName: objekt.name).environmentObject(objektVM)){
                        VStack(alignment: .leading) {
                            Text(area.title)
                                .font(.custom(FontStrings.appFontBlack, size: 22))
                                .foregroundStyle(Color.appBlue)
                            
                            Text("Anzahl der Räume (\(objektVM.spaceList.count))")
                                .font(.custom(FontStrings.appFontBold, size: 16))
                                .foregroundStyle(Color.appBlue)
                        }
                    }
                    .swipeActions {
                        Button(role: .destructive) {
                            withAnimation {
                                objektVM.deleteArea(with: String(area.id ?? ""))
                            }
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                    }
                    
                }
                .background(Color.appBackground)
                .scrollContentBackground(.hidden)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    AddAreaView(objekt: Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: ""), mail: ""))
}
