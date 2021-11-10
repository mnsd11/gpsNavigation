//
//  ViewController.swift
//  gpsNavigation
//
//  Created by DIRECTOR on 08.11.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager ()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        startLocationManager()
    }

    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            
            locationManager.desiredAccuracy=kCLLocationAccuracyHundredMeters
            
            locationManager.pausesLocationUpdatesAutomatically=false
            
            locationManager.startUpdatingLocation()
        }
    
    }
    

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
        }
    }
}
 
