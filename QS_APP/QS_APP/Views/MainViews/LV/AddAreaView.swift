//
//  AddAreaView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct AddAreaView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: "LV BEREICH ERSTELLEN"){
                    
                    Button(action: {
                        objektVM.showAddAreaSheet = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $objektVM.showAddAreaSheet){
                    AddAreaSheet()
                        .presentationDetents([.height(350)])
                        .environmentObject(objektVM)
                }
                .background(.appBackground)
                .onAppear{
                    objektVM.fetchArea(objektID: objektVM.objektID)
                }
                .onDisappear{
                    objektVM.cancelAreaListener()
                }
                
                List(objektVM.areaList, id: \.id){ area in
                    NavigationLink(destination: AddSpaceView().environmentObject(objektVM)){
                        VStack(alignment: .leading) {
                            Text(area.title)
                                .font(.custom(FontStrings.appFontBlack, size: 22))
                                .foregroundStyle(Color.appBlue)
                            
                            Text("Anzahl der Räume (Spaces)")
                                .font(.custom(FontStrings.appFontBold, size: 16))
                                .foregroundStyle(Color.appBlue)
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
    AddAreaView()
}
