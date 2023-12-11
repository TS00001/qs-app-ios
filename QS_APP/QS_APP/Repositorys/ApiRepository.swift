//
//  ApiRepository.swift
//  QS_APP
//
//  Created by Tom Salih on 11.12.23.
//

import Foundation

class ApiRepository{
    
    static func getAddress(enteredAddress: String) async throws -> ApiAdress {
        var baseURL = "https://api.geoapify.com/v1/geocode/autocomplete?text="
        let endURl = "lang=de&limit=3&format=json&apiKey=306311af969742299eb01be4f9fa4f28"
        
        baseURL.append(enteredAddress)
        baseURL.append(endURl)
        
        guard let baseUrl = URL(string: baseURL) else { return ApiAdress(results: [ApiResult(country: "", state: "", city: "", postcode: "", lon: 0.0, lat: 0.0, housenumber: "", formatted: "", address_line1: "", address_line2: "")])
        }
        
        let (data, _) = try await URLSession.shared.data(from: baseUrl)
        
        return try JSONDecoder().decode(ApiAdress.self, from: data)
    }
}
