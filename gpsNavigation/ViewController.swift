//
//  ViewController.swift
//  gpsNavigation
//
//  Created by DIRECTOR on 08.11.2021.
//
import FirebaseDatabase
import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager ()
    
    var ref: DatabaseReference!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
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


//lastLocation.coordinate.latitude
//lastLocation.coordinate.longitude

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
           // print(lastLocation.coordinate.latitude, lastLocation.coordinate.longitude)
            self.ref.child("latitude").setValue(lastLocation.coordinate.latitude)
            self.ref.child("longitude").setValue(lastLocation.coordinate.longitude)
            
        }
    }
}
 
