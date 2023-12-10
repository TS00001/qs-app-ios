//
//  MapView.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var location: MapCameraPosition = .region(.userRegion)
    
    var body: some View {
        Map(position: $location){
            Marker("OBJEKT", systemImage: Values.objektIcon, coordinate: .userLocation)
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
    MapView()
}
