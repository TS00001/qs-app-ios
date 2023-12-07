//
//  ObjektViewModel.swift
//  QS_APP
//
//  Created by Tom Salih on 29.11.23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class ObjektViewModel: ObservableObject {
    
    @Published var objektList = [Objekt]()
    
    private var listener: ListenerRegistration?
    
    init(){
        fetchObjekt()
    }
    /**
     Funktion um ein Objekt in Firestore zu erstellen
     @param objekt: Erwartet eine instanz des Models Objekt
     */
    func createObjekt(objekt: Objekt){
        //TODO: Englische benennung in der App/Datenbank/Code (Objekt Mehrzahl)
        //TODO: Strings für die Collections als Enum anlegen
        
        do{
            try FirebaseManager.shared.database.collection("objekt").addDocument(from: objekt)
        }catch let error{
            print("Fehler beim erstellen des Objektes", error.localizedDescription)
        }
    }
    
    func fetchObjekt(){
        self.listener = FirebaseManager.shared.database.collection("objekt")
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print("Fehler beim laden der Objekte", error.localizedDescription)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim laden der Dokumente")
                    return
                }
                self.objektList = documents.compactMap{ queryDocument -> Objekt? in
                    return try? queryDocument.data(as: Objekt.self)
                }
            }
    }
    
}
