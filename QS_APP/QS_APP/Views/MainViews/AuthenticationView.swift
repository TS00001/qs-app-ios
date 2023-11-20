//
//  AuthenticationView.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @EnvironmentObject var authenticationVM: AuthenticationViewModel
    
    //MARK: Variables
    
    @State private var mail = ""
    @State private var name = ""
    @State private var password = ""
    
    @State private var showRegister = false
    
    var enableBtn: Bool {
        return mail.isEmpty && password.isEmpty
    }

    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.appBlue)
                .ignoresSafeArea()
    
            Rectangle()
                .foregroundColor(.appBackground)
                .frame(width: 350, height: 350)
                .foregroundColor(.white)
                .cornerRadius(10)
            
            VStack{
                TextField("Email", text: $mail)
                    .padding(.leading, 20)
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .background(Color.white)
                    .textInputAutocapitalization(.never)
                
                
                SecureField("Passwort", text: $password)
                    .padding(.leading, 20)
                    .frame(width: 300, height: 50)
                    .cornerRadius(10)
                    .background(Color.white)
                    
                
                if !showRegister{
                    Button(action: {
                        logIn()
                    }, label: {
                        Text("Login")
                            .font(.callout)
                            .bold()
                            .foregroundStyle(Color.appBackground)
                            .padding(15)
                            .frame(width: 300)
                            .background(Color.appBlue)
                            .cornerRadius(10)
                    })
                        .padding(.top, 20)
                        .disabled(enableBtn)
                    
                    Button(action: {
                        changeToRegister()
                    }, label: {
                        Text("Noch kein Konto? Registrieren →")
                            .foregroundColor(.appBlue)
                            .font(.callout)
                    })
                    .padding(.top, 40)
                }else {
                    Button(action: {
                        register()
                    }, label: {
                        Text("Registrieren")
                            .font(.callout)
                            .bold()
                            .foregroundStyle(Color.appBackground)
                            .padding(15)
                            .frame(width: 300)
                            .background(Color.appBlue)
                            .cornerRadius(10)
                    })
                        .padding(.top, 20)
                        .disabled(enableBtn)
                    
                    Button(action: {
                        changeToRegister()
                    }, label: {
                        Text("← Zurück zum Login")
                            .foregroundColor(.appBlue)
                            .font(.callout)
                            
                    })
                    .padding(.top, 40)
                }
            }
        }
    }
    
    
    //MARK: Funktionen
    
    
    func logIn(){
        authenticationVM.login(email: self.mail, password: self.password)
    }
    
    func register(){
        if name.isEmpty{
            authenticationVM.register(email: self.mail, password: self.password, name: nil)
        }else {
            authenticationVM.register(email: self.mail, password: self.password, name: name)
        }
        
    }
    
    func changeToRegister(){
        showRegister.toggle()
    }
    
}

#Preview {
    AuthenticationView()
}
