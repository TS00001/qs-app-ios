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
        NavigationStack {
            
            ZStack{
                Rectangle()
                    .foregroundColor(.appBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    SettingsTopBar(title: "EINSTELLUNGEN", BtnIcon: "power.circle.fill", BtnAction: logout)
                    
                    SettingsUserProfilCard(name: "Tom Salih", position: "Qualitässicherung", profilImage: "profilImage")
                      
                    SettingsListItem(icon: "shield", title: "Datenschutz")
                    SettingsListItem(icon: "info.square", title: "Impressum")
                    SettingsListItem(icon: "doc.plaintext", title: "Lizenzen")
                    Spacer()
                }
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
