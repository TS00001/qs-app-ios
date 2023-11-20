//
//  TabBarView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - Variables
    
    @State var selectedTab: TabItem = .home
    
    var body: some View {
        

        TabView(selection: $selectedTab) {
            
            HomeView()
                .tabItem {
                    Label(TabItem.home.title, systemImage: TabItem.home.icon)
                }
                .tag(TabItem.home)
                
            ObjektView()
                .tabItem {
                    Label(TabItem.objekte.title, systemImage: TabItem.objekte.icon)
                }
                .tag(TabItem.objekte)
            
            CalculatorView()
                .tabItem {
                    Label(TabItem.rechner.title, systemImage: TabItem.rechner.icon)
                }
                .tag(TabItem.rechner)
            
            SettingeView()
                .tabItem {
                    Label(TabItem.einstellungen.title, systemImage: TabItem.einstellungen.icon)
                }
                .tag(TabItem.einstellungen)
        }
//        .toolbarBackground(.appBlue, for: .tabBar)
//        .accentColor(Color.appBlue)
        
    }
}

#Preview {
    TabBarView()
}
