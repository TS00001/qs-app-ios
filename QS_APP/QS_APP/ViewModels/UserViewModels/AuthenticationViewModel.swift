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
    
    /**
    Funktion zum Überprüfen der Authentifizierung des Benutzers
     */
    private func checkAuth(){
        // Überprüfen, ob ein aktueller Benutzer (currentUser) vorhanden ist
        guard let currentUser = auth.currentUser else {
            // Ausgabe in der Konsole, wenn kein aktueller Benutzer vorhanden ist
            print("NICHT EINGELOGGT!")
            // Die Funktion beenden, da kein Benutzer eingeloggt ist
            return
        }
        // Falls ein aktueller Benutzer vorhanden ist, wird die Funktion fetchUser aufgerufen, um Benutzerdaten abzurufen
        self.fetchUser(with: currentUser.uid)
    }
    
    /**
     Funktion zur Registrierung eines neuen Benutzers
     @param email: Die email Adresse des Users
     @param password: Das Password für den Login
     @param name: Der Username der im Profil angezeigt wird (optional)
     */
    func register(email: String, password: String, name: String?){
        // Verwenden der Firebase Authentifizierung, um einen Benutzer mit E-Mail und Passwort zu erstellen
        auth.createUser(withEmail: email, password: password) {
            authResult, error in
            if let error {
                // Ausgabe in der Konsole, wenn die Registrierung fehlschlägt
                print("Registration failed:", error.localizedDescription)
                // Beenden der Funktion, da die Registrierung fehlgeschlagen ist
                return
            }
            
            // Überprüfen, ob die Registrierung erfolgreich war, und die E-Mail-Adresse des neuen Benutzers abrufen
            guard let authResult, let email = authResult.user.email else { return }
            // Ausgabe in der Konsole mit der E-Mail und der UID des registrierten Benutzers
            print("User with email '\(email)' is registered with id '\(authResult.user.uid)'")
            
            // Aufrufen der createUser-Funktion, um Benutzerdaten in der Firestore-Datenbank zu erstellen
            self.createUser(with: authResult.user.uid, email: email, name: name)
            
            // Anmelden des Benutzers nach erfolgreicher Registrierung
            self.login(email: email, password: password)
        }
    }
    
    /**
     Funktion zum Anmelden eines Benutzers mit E-Mail und Passwort
     @param email: Die emali des Benutzers
     @param password: Das password des Benutzers
     */
    func login(email: String, password: String){
        // Verwenden der Firebase Authentifizierung, um einen Benutzer mit E-Mail und Passwort anzumelden
        auth.signIn(withEmail: email, password: password){
            authResult, error in
            // Überprüfen, ob ein Fehler beim Anmelden aufgetreten ist
            if let error {
                // Ausgabe in der Konsole, wenn das Anmelden fehlschlägt
                print("LOGIN FEHLGESCHLAGEN:", error.localizedDescription)
                // Beenden der Funktion, da das Anmelden fehlgeschlagen ist
                return
            }
            // Überprüfen, ob das Anmelden erfolgreich war
            guard let authResult, let email = authResult.user.email else { return }
            
            // Ausgabe in der Konsole mit der E-Mail und der UID des angemeldeten Benutzers
            print("User with email '\(email)' is logged in with id '\(authResult.user.uid)'")
            
            // Aufrufen der fetchUser-Funktion, um die Benutzerdaten aus der Firestore-Datenbank abzurufen
            self.fetchUser(with: authResult.user.uid)
        }
    }
    
    /**
     Funktion zum Abmelden des aktuellen Benutzers
     */
    func logout(){
        // Versuch, den aktuellen Benutzer abzumelden
        do {
            // Setzen des Benutzers auf nil, um anzuzeigen, dass kein Benutzer mehr angemeldet ist
            try auth.signOut()
            // Ausgabe in der Konsole, dass der Benutzer erfolgreich abgemeldet wurde
            self.user = nil
            
            print("User wurde abgemeldet!")
        }catch {
            // Fehlerbehandlung, falls das Abmelden fehlschlägt
            print("Error signing out: ", error.localizedDescription)
        }
    }
}
