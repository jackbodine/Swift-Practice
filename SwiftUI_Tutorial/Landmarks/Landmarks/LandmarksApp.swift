//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Jack Bodine on 1/31/23.
//

import SwiftUI

@main   // Identifies the app entry point.
struct LandmarksApp: App {  // Conforms to App protocall.
    @StateObject private var modelData = ModelData()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
