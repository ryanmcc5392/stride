//
//  ContentView.swift
//  stride
//
//  Created by Ryan McCallister on 10/26/24.
//

import SwiftUI
import SwiftData
import MapKit
import CoreLocation

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    @State var currentLocation: CLLocation?
    @State var cameraLocation: MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), distance: 2))

    var body: some View {
        Map(position: $cameraLocation)
            .frame(height: 100)
            Button("Get Location") {
                locationManager.requestLocationAuthorization()
            }
    }

}

#Preview {
    ContentView()
}

