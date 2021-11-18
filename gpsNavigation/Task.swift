//
//  Task.swift
//  gpsNavigation
//
//  Created by DIRECTOR on 16.11.2021.
//

import Foundation
import Firebase

struct Task {
    let latitude: Double
    let longitude: Double
    let ref: DatabaseReference?
    
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        self.ref = nil
    }
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: AnyObject]
        latitude = snapshotValue["latitude"] as! Double
        longitude = snapshotValue["longitude"] as! Double
        ref = snapshot.ref
    }
    
    func convertToDictionary() -> Any {
        return ["latitude": latitude, "longitude": longitude]
    }
}
