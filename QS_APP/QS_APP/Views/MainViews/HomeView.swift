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
                CustomHeader(title: "FÄLLIGE QS"){
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
                    ForEach(1...10, id: \.self){ item in
                        
                        QsListItem(icon: Values.qsIcon, title: "Bäckerei Gauker", adress: "Eugenstraße 10, 72072 Tübingen")
                    }
                    .padding(.horizontal, Values.middlePadding)
                    
                }
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
