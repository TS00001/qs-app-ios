//
//  MainView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    
    var body: some View {
        
        TabBarView()
            .environmentObject(authenticationVM)
    }
}

#Preview {
    MainView()
}
