//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Jack Bodine on 1/31/23.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false    // State variables are always private, they are only accessable by a view and its subviews
    @EnvironmentObject var modelData: ModelData

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $showFavoritesOnly) {  // $ means we are accessing the binding of a state variable.
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
        }.navigationTitle("Landmarks")
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
