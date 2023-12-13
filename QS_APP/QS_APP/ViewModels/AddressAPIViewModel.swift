//
//  AddressAPIViewModel.swift
//  QS_APP
//
//  Created by Tom Salih on 11.12.23.
//

import Foundation

// URL: https://api.geoapify.com/v1/geocode/autocomplete?text=YOUR_TEXT&lang=de&format=json&apiKey=YOUR_API_KEY
// let apiKey = "306311af969742299eb01be4f9fa4f28"

@MainActor
class AddressAPIViewModel: ObservableObject {
    
    @Published var address = ApiAdress(results: [ApiResult(country: "", state: "", city: "", housenumber: "", postcode: "", lon: 0.0, lat: 0.0, formatted: "", address_line1: "", address_line2: "")])
    
    func getAddress(enteredAddress: String) {
        Task{
            do{
                self.address = try await ApiRepository.getAddress(enteredAddress: enteredAddress)
            }catch {
                print("API KONNTE NICHT GELADEN WERDEN.", error)
            }
        }
    }
    
    
    
    
}
