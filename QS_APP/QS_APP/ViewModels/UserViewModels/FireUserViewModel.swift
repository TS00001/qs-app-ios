//
//  FireUserViewModel.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import Foundation
import FirebaseAuth

extension AuthenticationViewModel{
    
    func createUser(with id: String, email: String, name: String?){
        let user = FireUser(id: id, name: name, email: email, registrateDate: Date())
        
        do{
            try
            FirebaseManager.shared.database.collection("users").document(id).setData(from: user)
        }catch let error {
            print("Fehler beim Speichern des Users: \(error)")
        }
    }
    
    func fetchUser(with id: String){
        FirebaseManager.shared.database.collection("users").document(id).getDocument{ document, error in
            if let error {
                print("Fetching user failed:", error.localizedDescription)
                return
            }
            guard let document else {
                print("Document does not exist!")
                return
            }
            do{
                let user = try
                document.data(as: FireUser.self)
                self.user = user
            }catch {
                print("Document is not a user!", error.localizedDescription)
            }
        }
    }
}
