//
//  ContentView.swift
//  QS_APP
//
//  Created by Tom Salih on 16.11.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authenticationVM = AuthenticationViewModel()
    
    var body: some View {
        AuthenticationView()
            
    }
}

#Preview {
    ContentView()
}
