//
//  CustomHeaderIcon.swift
//  QS_APP
//
//  Created by Tom Salih on 26.11.23.
//

import SwiftUI

struct CustomHeaderIcon: View {
    
    //MARK: VARIABLES
    let icon: String
    
    var body: some View {
        
        Image(systemName: icon)
            .resizable()
            .frame(width: 30, height: 30)
            .padding(.trailing, Values.middlePadding)
            .bold()
            .foregroundColor(.appBlue)
    }
}

#Preview {
    CustomHeaderIcon(icon: Values.plus)
}
