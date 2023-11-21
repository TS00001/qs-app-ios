//
//  SettingeView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct SettingeView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    @Binding var selectedTab: TabItem
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(.appBackground)
                .ignoresSafeArea()
            
            NavigationStack {
                Form{
                    
                    Section(){
                        Text("Datenschutzerklärung")
                            .font(.callout)
                            .foregroundStyle(Color.appBlue)
                            
                        Text("Impressum")
                            .font(.callout)
                            .foregroundStyle(Color.appBlue)
                        
                        Text("Lizienzen")
                            .font(.callout)
                            .foregroundStyle(Color.appBlue)
                    }
                    
                    Section(){
                        Button(action: {
                           logout()
                        },label:{
                            Text("Abmelden")
                                .font(.callout)
                                .foregroundStyle(Color.appRed)
                        })
                    }
                }
                .navigationTitle("Einstellungen")
                .foregroundColor(Color.appBlue)
            }
        }
    }
    
    func logout(){
        authenticationVM.logout()
        selectedTab = .home
    }
}

#Preview {
    SettingeView(selectedTab: .constant(.einstellungen))
}
