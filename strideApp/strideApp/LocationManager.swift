//
//  LocationManager.swift
//  strideApp
//
//  Created by Ryan McCallister on 10/26/24.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.requestLocationAuthorization()
    }

    func requestLocationAuthorization() {
        locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Location access granted.")
            locationManager.startUpdatingLocation()
        case .denied:
            print("Location access denied.")
        case .notDetermined:
            print("Location access not determined.")
        case .restricted:
            print("Location access restricted.")
        @unknown default:
            print("Unknown authorization status.")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}

