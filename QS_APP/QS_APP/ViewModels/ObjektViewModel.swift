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
    
    func createObjekt(name: String, street: String, postalCode: String, city: String, mail: String, contactPerson: String?, objectManager: String?, cleaningPerson: String?, listOfServices: [Area], qualityAssurance: [QualityAssurance]){
        
        let adress = Adress(street: street, postalCode: postalCode, city: city)
        
        let objekt = Objekt(name: name, adress: adress, mail: mail, contactPerson: contactPerson, cleaningPerson: cleaningPerson, objectManager: objectManager, interval: Interval.one.intervalString, listOfServices: listOfServices, qualityAssurance: qualityAssurance)
        
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
