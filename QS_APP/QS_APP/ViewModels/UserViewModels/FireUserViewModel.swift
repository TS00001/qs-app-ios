//
//  FireUserViewModel.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import Foundation
import FirebaseAuth

extension AuthenticationViewModel{
    /**
     Funktion zum Erstellen eines Benutzers in der Firebase-Datenbank
     @param id: ID des erstellten User (wird automatisch generiert)
     @param email: Die email des Users
     @param name: Der name des Users
     */
    func createUser(with id: String, email: String, name: String?){
        
        //Erstellen eines FireUser-Objekts mit den übergebenen Parametern
        let user = FireUser(id: id, name: name, email: email, registrateDate: Date())
        
        do{
            // Versuch, die Benutzerdaten in der Firebase-Datenbank zu speichern
            try
            FirebaseManager.shared.database.collection("users").document(id).setData(from: user)
        }catch let error {
            // Fehlerbehandlung, falls das Speichern fehlschlägt
            print("Fehler beim Speichern des Users: \(error)")
        }
    }
    
    /**
     Funktion zum Abrufen eines Benutzers aus der Firebase-Datenbank anhand der ID
     @param id:  ID des User
     */
    func fetchUser(with id: String){
        // Abrufen des Dokuments aus der Firebase-Datenbank
        FirebaseManager.shared.database.collection("users").document(id).getDocument{ document, error in
            if let error {
                // Fehlerbehandlung, falls beim Abrufen ein Fehler auftritt
                print("Fetching user failed:", error.localizedDescription)
                return
            }
            // Hier wird überprüft, ob das Dokument existiert
            guard let document else {
                print("Document does not exist!")
                return
            }
            do{
                // Versuch, das Dokument in ein FireUser-Objekt umzuwandeln
                let user = try
                document.data(as: FireUser.self)
                // Setzen des Benutzers in der Klasse/Struktur, die diesen Code enthält
                self.user = user
            }catch {
                print("Document is not a user!", error.localizedDescription)
            }
        }
    }
}
