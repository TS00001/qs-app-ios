//
//  QsView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI

struct QsView: View {
    var body: some View {
        
        VStack{
            CustomHeaderBack(title: "QS START"){
                
                Button(action: {
                    
                }, label: {
                    CustomHeaderIcon(icon: Values.editIcon)
                })
            }
            Spacer()
        }
        .vstackModi()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QsView()
}
