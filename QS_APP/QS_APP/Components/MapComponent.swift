//
//  MapComponent.swift
//  QS_APP
//
//  Created by Tom Salih on 10.12.23.
//

import SwiftUI
import MapKit

struct MapComponent: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapComponent>) -> MKMapView {

        MKMapView()
    }

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapComponent>) {

        // set coordinates (lat lon)
        let coords = CLLocationCoordinate2D(latitude: 53.062640, longitude: -2.968900)

        // set span (radius of points)
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)

        // set region
        let region = MKCoordinateRegion(center: coords, span: span)

        // set the view
        uiView.setRegion(region, animated: true)
    }
}

#Preview {
    MapComponent()
}
