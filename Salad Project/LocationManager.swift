//
//  LocationManager.swift
//  Salad Project
//
//  Created by Yunfan Yang on 8/27/21.
//

import CoreLocation
import MapKit
import Foundation


class LocationManager: NSObject, ObservableObject{
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation? = nil
    @Published var heading: CLHeading? = nil
    
    override init(){
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.startUpdatingHeading()
    }
    
}

extension LocationManager: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        print(status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
    
    /*
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newheading: CLHeading){
        self.heading = newheading
    }
    */
    
    
}
 

