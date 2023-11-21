//
//  QS_APPApp.swift
//  QS_APP
//
//  Created by Tom Salih on 16.11.23.
//

import SwiftUI
import Firebase

@main
struct QS_APPApp: App {
    
    @StateObject var authenticationVM = AuthenticationViewModel()
    
    @StateObject var homeVM = HomeViewModel()
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        
        WindowGroup {
            
            if authenticationVM.userIsLoggedIn{
                MainView()
                    .environmentObject(authenticationVM)
                    .environmentObject(homeVM)
            }else {
                AuthenticationView()
                    .environmentObject(authenticationVM)
            }
        }
    }
}
