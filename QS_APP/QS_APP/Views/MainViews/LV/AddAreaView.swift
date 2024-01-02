//
//  AddAreaView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct AddAreaView: View {
    
    @EnvironmentObject var objektVM: ObjektViewModel
    
    @State var showAddAreaSheet = false
    
    @State var objektID = ""
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: "LV BEREICH ERSTELLEN"){
                    
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                
                Text("Füge einen neuen Bereich hinzu, indem du auf das + drückst.")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 40)
                    .padding(.top, 250)
                    .font(.custom(FontStrings.appFontBlack, size: 22))
                    .foregroundStyle(Color.appBlue)
                
                Spacer()
                
                VStack{
                    
                    Button(action: {
                        showAddAreaSheet = true
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .bold()
                            .foregroundColor(.appBackground)
                            .padding()
                    })
                }
                .frame(width: 60, height: 60)
                .background(.appBlue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                
            }
            .background(.appBackground)
            .sheet(isPresented: $showAddAreaSheet){
                AddAreaSheet(shawAddAreaSheet: $showAddAreaSheet, objektID: objektID)
                    .presentationDetents([.height(350)])
                    .environmentObject(objektVM)
            }
            
            .background(.appBackground)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AddAreaView()
}
