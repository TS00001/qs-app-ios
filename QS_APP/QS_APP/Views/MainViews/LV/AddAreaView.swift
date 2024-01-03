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
    
    var objektID = ""
    
    
    
    init(objektID: String){
        self.objektID = objektID
        print("TEST")
    }
    
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 0 ){
                CustomHeaderBack(title: "LV BEREICH ERSTELLEN"){
                    
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                ScrollView{
                    ForEach(objektVM.areaList, id: \.id){ area in
                        LvItem(title: area.title)
                            .padding(.horizontal, Values.middlePadding)
                            .padding(.bottom, Values.middlePadding)
                    }
                }
                
                Text("Füge einen neuen Bereich hinzu, indem du auf das + drückst.")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 40)
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
                AddAreaSheet(showAddAreaSheet: $showAddAreaSheet, objektID: objektID)
                    .presentationDetents([.height(350)])
                    .environmentObject(objektVM)
            }
            .background(.appBackground)
            .onAppear{
                objektVM.fetchArea(objektID: objektID)
            }
            .onDisappear{
                objektVM.cancelAreaListener()
            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}


//struct AddAreaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddAreaView(objektID: "", objektVM: ObjektViewModel())
//    }
//}


//#Preview {
//    AddAreaView(objektID: "", objektVM: ObjektViewModel())
//}
