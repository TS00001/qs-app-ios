//
//  AddSpaceView.swift
//  QS_APP
//
//  Created by Tom Salih on 11.12.23.
//

import SwiftUI

struct AddSpaceView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
//    @Binding var objekt: Objekt
//    var areaID = ""
    
//    @State var showAddSpaceSheet = false
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: "LV RAUM ERSTELLEN"){
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $objektVM.showAddSpaceSheet){
                    AddSpaceSheet()
//                        .presentationDetents([.height(350)])
                        .environmentObject(objektVM)
                }
                .background(.appBackground)
                .onAppear{
                    objektVM.fetchSpace(areaID: objektVM.spaceID)
                }
                .onDisappear{
                    objektVM.cancelSpaceListener()
                }

                Text("Füge einen neuen Raum hinzu, indem du auf das + drückst.")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 40)
                    .padding(.top, 250)
                    .font(.custom(FontStrings.appFontBlack, size: 22))
                    .foregroundStyle(Color.appBlue)
                
                Spacer()
                
                VStack{
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .bold()
                        .foregroundColor(.appBackground)
                        .padding()
                        .onTapGesture {
                            objektVM.showAddSpaceSheet = true
                        }
                }
                .frame(width: 60, height: 60)
                .background(.appBlue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
               
            }
            .background(.appBackground)
            .sheet(isPresented: $objektVM.showAddSpaceSheet){
                AddSpaceSheet().environmentObject(objektVM)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddSpaceView()
}
