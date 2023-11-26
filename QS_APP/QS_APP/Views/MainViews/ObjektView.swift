//
//  ObjektView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct ObjektView: View {
    
    //MARK: VRIABLES
    @State var showAddObjektSheet = false
    
    var body: some View {
        
        ZStack{
            
            AppBackground(color: .appBackground)
            
            VStack {
                CustomHeader(title: "OBJEKTE"){
                    Button(action: {
                        showAddObjektSheet = true
                    }, label: {
                        CustomHeaderIcon(icon: Values.plus)
                    })
                }
                .sheet(isPresented: $showAddObjektSheet) {
                    AddObjektSheet()
                }
                
                ScrollView{
                    ForEach(1...10, id: \.self){ item in
                        QsListItem(icon: Values.objektIcon, title: "Bäckerei Gauker", adress: "Eugenstraße 10, 72072 Tübingen")
                    }
                    .padding(.horizontal, Values.middlePadding)
                    
                }
            }
            
        }
    }
    
    func addObjekt(){
        
        // TODO: Funktion um ein neues Objekt zu erstellen.
    }
}

#Preview {
    ObjektView()
}
