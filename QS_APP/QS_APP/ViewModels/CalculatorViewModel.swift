//
//  CalculatorViewModel.swift
//  QS_APP
//
//  Created by Tom Salih on 04.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CalculatorViewModel: ObservableObject {
    
    @Published var resultList: [Result] = []
    @Published var offerList: [Offer] = []
    
    @Published var hours: Double = 0.0
    @Published var totalHours: Double = 0.0
    
    @Published var quadratmeter: String = ""
    @Published var totalQuadratmeter: Double = 0.0
    
    @Published var roomDescription: String = ""
    @Published var selectedMultiplier: Double = 1.0
    
    @Published var showCalculatorSheet = false
    
    let multipliers = [220.0, 160.0, 80.0, 300.0]
    let multiplierTitles: [Double: String] = [
            220.0: "Büro",
            160.0: "Treppe",
            80.0: "Sanitär",
            300.0: "Flur"
        ]
    
    @Published var result = Result(roomDescription: "", quadratmeter: 0.0, hours: 0.0)
    @Published var offer = Offer(resultID: "", totalHours: 0.0, totalQuadratmeter: 0.0)
    
    private var listener: ListenerRegistration?
    private var resultListener: ListenerRegistration?
    
    func createOffer(offer: Offer){
        do{
            try FirebaseManager.shared.database.collection("offer").addDocument(from: result)
        }catch let error{
            print("Fehler beim erstellen des Angebots", error.localizedDescription)
        }
    }
    
    func fetchResult(){
        self.resultListener = FirebaseManager.shared.database.collection("offer")
            .addSnapshotListener{ querySnapshot, error in
                if let error {
                    print("Fehler beim laden der Offer", error.localizedDescription)
                    return
                }
                
                guard let documents = querySnapshot?.documents
                else {
                    print("Fehler beim laden der Offer")
                    return
                }
                self.offerList = documents.compactMap{
                    queryDocument -> Offer? in
                    return try? queryDocument.data(as: Offer.self)
                }
            }
        
    }
    
    func calculateResult() {
        guard let quadratmeter = Double(quadratmeter), !roomDescription.isEmpty else {
            return
        }
        
        let resultValue = (quadratmeter / selectedMultiplier)
        let result = Result(roomDescription: roomDescription, quadratmeter: quadratmeter, hours: resultValue)
        self.hours = resultValue
        resultList.append(result)
    }
    
    
    func iconForMultiplier(_ multiplier: Double) -> String {
        
        switch multiplier {
        case 220.0:
            return "1.circle.fill"
        case 160.0:
            return "2.circle.fill"
        case 80.0:
            return "3.circle.fill"
        case 300.0:
            return "4.circle.fill"
        default:
            return ""
        }
    }
    
    func titleForMultiplier(_ multiplier: Double) -> String {
           return multiplierTitles[multiplier] ?? "n/a"
       }
    
    func formattedResult(_ value: Double? = nil) -> String {
        if let resultValue = value {
            return String(format: "%.2f", resultValue)
        } else {
            return "0.00"
        }
    }
    
    func deleteResult(with id: String) {
        FirebaseManager.shared.database.collection("result").document(id).delete() { error in
            if let error {
                print("Result konnte nicht gelöscht werden", error.localizedDescription)
                return
            }
            print("Result wurde gelöscht")
        }
    }
    
    func calculateTotal() {
        addQuadratmeter()
        addHours()
       }
    
    func addHours(){
        self.totalHours += hours
    }

    func addQuadratmeter(){
        self.totalQuadratmeter += Double(quadratmeter) ?? 0.0
    }
    
    


}
