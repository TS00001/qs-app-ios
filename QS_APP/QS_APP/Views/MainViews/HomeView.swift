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
                        planQs()
                    }, label: {
                        CustomHeaderIcon(icon: Values.calendar)
                    })
                }
        
                ScrollView{
                    QsOverviewItem(rating: .constant(3))
                    Text("FÄLLIGE QS")
                        .titleStyle()
                    
                    ForEach(1...5, id: \.self){ item in
                        
                        ObjektAndQsListItem(icon: Values.qsIcon, title: "Bäckerei Gauker", street: "Eugenstraße 10", postalCode: "72072", city: "Tübingen")
                    }
                }
                .padding(.horizontal, Values.middlePadding)
            }
            .background(.appBackground)
        }
    }
    
    func planQs(){
        //TODO: Sheet um eine QS zu planen die dann in fällige QS aufgelistet werden soll
    }
}

#Preview {
    HomeView()
}
