//
//  ViewController.swift
//  gpsNavigation
//
//  Created by DIRECTOR on 08.11.2021.
import Firebase
import UIKit
import CoreLocation
import FirebaseDatabase

var timer: Timer?

class ViewController: UIViewController {
    let locationManager = CLLocationManager ()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer=Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(startLocationManager), userInfo: nil, repeats: true)
            ref=Database.database(url: "https://gpsnavigation2-1ce6d-default-rtdb.europe-west1.firebasedatabase.app/").reference()
        //Database.database().reference()
        // Do any additional setup after loading the view.
        startLocationManager()
    }

    @objc func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.pausesLocationUpdatesAutomatically = true
            locationManager.startUpdatingLocation()
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            sleep(15)
            locationManager.startUpdatingLocation()
            locationManager.stopUpdatingLocation()
            self.ref.child("latitude_\(NSDate())").setValue(locations.last!.coordinate.latitude)
            self.ref.child("longitude_\(NSDate())").setValue(locations.last!.coordinate.longitude)
            locationManager.startUpdatingLocation()
            
    }
}
