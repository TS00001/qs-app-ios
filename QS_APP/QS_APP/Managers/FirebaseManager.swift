//
//  FirebaseManager.swift
//  QS_APP
//
//  Created by Tom Salih on 20.11.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseManager {
    static let shared = FirebaseManager()
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    // Bereitstellung der aktuellen Benutzer-ID, wenn ein Benutzer angemeldet ist, andernfalls nil
    var userId: String? {
        auth.currentUser?.uid
    }
}
