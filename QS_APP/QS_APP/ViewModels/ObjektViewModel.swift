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
    @Published var areaList = [Area]()
    @Published var spaceList = [Space]()
    
    @Published var showAddObjektSheet = false
    @Published var showUpdateCleaningdaysSheet = false
    @Published var showUpdateQsIntervallSheet = false
    @Published var showUpdateObjektInformations = false
    
    @Published var showAddAreaSheet = false
    @Published var showAddSpaceSheet = false
    @Published var objektID = ""
    @Published var spaceID = ""
    @Published var areaTitle = ""
    
    @Published var objekt = Objekt(name: "", adress: Adress(street: "", housenumber: "", postalCode: "", city: ""), mail: "")
    
    private var listener: ListenerRegistration?
    
    private var areaListener: ListenerRegistration?
    private var spaceListener: ListenerRegistration?
    
    init(){
        self.fetchObjekt()
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
    
    func deleteObjekt(with id: String){
        FirebaseManager.shared.database.collection("objekt").document(id).delete() { error in
            if let error {
                print("Objekt konnte nicht gelöscht werden", error.localizedDescription)
                return
            }
            print("Objekt wurde gelöscht")
        }
    }
    
    func deleteArea(with id: String){
        FirebaseManager.shared.database.collection("area")
            .document(id).delete(){ error in
                if let error {
                    print("Area konnte nicht gelöscht werden", error.localizedDescription)
                    return
                }
                print("Area wurde gelöscht")
            }
    }
    
    func deleteSpace(with id: String){
        FirebaseManager.shared.database.collection("space")
            .document(id).delete(){ error in
                if let error {
                    print("Space konnte nicht gelöscht werden", error.localizedDescription)
                    return
                }
                print("Space wurde gelöscht")
            }
    }
    
    func updateObjektInformations(with id: String, data: Objekt) {
        
        let db = FirebaseManager.shared.database.collection("objekt").document(id)
        do{
            try db.setData(from: data)
            print("Objekt aktualisiert!")
        }catch{
            print("Fehler beim updaten des Objektes")
        }
    }
    
    func updateCleaningDays(with id: String, data: [String : Any]){
        
        FirebaseManager.shared.database.collection("objekt").document(id).setData(data, merge: true) { error in
            if let error {
                print("Reinigungstage konnten nicht aktualisiert werden", error.localizedDescription)
                return
            }
            
            print("Reinigungstage aktualisiert!")
        }
        
    }
    
    func updateIntervall(with id: String, data: [String : Any]){
        
        FirebaseManager.shared.database.collection("objekt").document(id).setData(data, merge: true) { error in
            if let error {
                print("Intervall konnten nicht aktualisiert werden", error.localizedDescription)
                return
            }
            
            print("Intervall aktualisiert!")
        }
        
    }
    
    func createArea(with id: String, area: Area){
        do{
            try FirebaseManager.shared.database.collection("area").addDocument(from: area)
        }catch let error{
            print("Fehler beim erstellen des Area", error.localizedDescription)
        }
    }
    
    func createSpace(with id: String, space: Space){
        do{
            try FirebaseManager.shared.database.collection("space").addDocument(from: space)
        }catch let error{
            print("Fehler beim erstellen des Space", error.localizedDescription)
        }
    }
    
    func fetchArea(objektID: String){
        self.areaListener = FirebaseManager.shared.database.collection("area").whereField("objektID", isEqualTo: objektID)
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print("Fehler beim laden der Areas", error.localizedDescription)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim laden der Areas")
                    return
                }
                self.areaList = documents.compactMap{ queryDocument -> Area? in
                    return try? queryDocument.data(as: Area.self)
                }
            }
    }
    
    func cancelAreaListener(){
        self.areaListener?.remove()
    }
    
    func cancelSpaceListener(){
        self.spaceListener?.remove()
    }
    
    func cancelListener(){
        self.listener?.remove()
    }
    
    
    func fetchSpace(areaID: String){
        FirebaseManager.shared.database.collection("space").whereField("areaID", isEqualTo: areaID)
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print("Fehler beim laden der Areas", error.localizedDescription)
                    return
                }
                guard let documents = querySnapshot?.documents else {
                    print("Fehler beim laden der Areas")
                    return
                }
                self.areaList = documents.compactMap{ queryDocument -> Area? in
                    return try? queryDocument.data(as: Area.self)
                }
            }
    }
    
    func cancelObjekt(){
        showUpdateObjektInformations = false
    }
    
    
}
