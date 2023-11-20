//
//  AuthenticationViewModel.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import Foundation
import FirebaseAuth

class AuthenticationViewModel: ObservableObject{
    
    @Published var user: FireUser?
    
    private var auth = Auth.auth()
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    init(){
        checkAuth()
    }
    
    
    private func checkAuth(){
        guard let currentUser = auth.currentUser else {
            print("NICHT EINGELOGGT!")
            return
        }
        self.fetchUser(with: currentUser.uid)
    }
    
    func register(email: String, password: String, name: String?){
        auth.createUser(withEmail: email, password: password) {
            authResult, error in
            if let error {
                print("Registration failed:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            self.createUser(with: authResult.user.uid, email: email, name: name)
            
            self.login(email: email, password: password)
        }
    }
    
    func login(email: String, password: String){
        auth.signIn(withEmail: email, password: password){
            authResult, error in
            if let error {
                print("LOGIN FEHLGESCHLAGEN:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else { return }
            
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            self.fetchUser(with: authResult.user.uid)
        }
    }
    
    func logout(){
        do {
            try auth.signOut()
            self.user = nil
            
            print("User wurde abgemeldet!")
        }catch {
            print("Error signing out: ", error.localizedDescription)
        }
    }
}
