//
//  MapView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var location: MapCameraPosition
    
    let markerTitle: String
    let markerIcon: String
    let coordinate: CLLocationCoordinate2D
    
    init(latitude: Double, longitude: Double) {
        _location = State(initialValue: .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), latitudinalMeters: 60, longitudinalMeters: 60)))
        self.markerTitle = "OBJEKT"
        self.markerIcon = Values.objektIcon
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var body: some View {
        Map(position: $location){
            Marker(markerTitle, systemImage: markerIcon, coordinate: coordinate)
                .tint(.appBlue)
        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 48.51959861846929, longitude: 9.057984167586223)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, latitudinalMeters: 60, longitudinalMeters: 60)
    }
}

//MARK: LINK -> https://www.youtube.com/watch?v=gy6rp_pJmbo

#Preview {
    MapView(latitude: 48.51959861846929, longitude: 9.057984167586223)
}
