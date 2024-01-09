//
//  AddSpaceView.swift
//  QS_APP
//
//  Created by Tom Salih on 11.12.23.
//

import SwiftUI

struct AddSpaceView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    var areaID: String
    var objektName: String
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: objektName){
                    
                    Button(action: {
                        objektVM.showAddSpaceSheet.toggle()
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $objektVM.showAddSpaceSheet){
                    AddSpaceSheet(areaID: areaID).environmentObject(objektVM)
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
                        
                        Text("Anzahl der Räume (Spaces)")
                            .font(.custom(FontStrings.appFontBold, size: 16))
                            .foregroundStyle(Color.appBlue)
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
    }
}

#Preview {
    AddSpaceView(areaID: "", objektName: "")
}
