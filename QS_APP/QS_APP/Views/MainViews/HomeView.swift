//
//  HomeView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        ZStack{
            
            AppBackground(color: .appBackground)
            
            VStack {
                CustomHeader(title: "HOME"){
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.qsIcon)
                    })
                   
                    Button(action: {
                        
                    }, label: {
                        CustomHeaderIcon(icon: Values.calendar)
                    })
                }
        
                ScrollView{
                    QsOverviewItem()
                    Text("FÄLLIGE QS")
                        .titleStyle()
                    ForEach(1...5, id: \.self){ item in
                        
                        ObjektAndQsListItem(icon: Values.qsIcon, title: "Bäckerei Gauker", street: "Eugenstraße 10", postalCode: "72072", city: "Tübingen")
                    }
                }
                .padding(.horizontal, Values.middlePadding)
            }
        }
    }
    
    func planQs(){
        //Funktion zum planen einer QS (ein Sheet soll sich beim klick öffnen)
    }
}

#Preview {
    HomeView()
}
