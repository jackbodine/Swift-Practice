//
//  Landmark.swift
//  Landmarks
//
//  Created by Jack Bodine on 1/31/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable, Identifiable {    // Conforms to Hashable and Codable. Codable makes it easier to move data between the structure and a data file
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    var isFavorite: Bool
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

}
