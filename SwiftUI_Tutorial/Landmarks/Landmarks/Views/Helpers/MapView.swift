//
//  MapView.swift
//  Landmarks
//
//  Created by Jack Bodine on 1/31/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // @State attribute establishes a source of truth for data that you can modify from more than one view. SwiftUI automatically updates the views when a State variable is changed.
    @State private var region = MKCoordinateRegion()
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    var body: some View {
        Map(coordinateRegion: $region)  // The $ symbol means we are passing in a binding. Which is like a reference the the underlying value.
            .onAppear {
                setRegion(coordinate)
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
