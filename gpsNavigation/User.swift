//
//  User.swift
//  gpsNavigation
//
//  Created by DIRECTOR on 16.11.2021.
//

import Foundation
import Firebase

struct User {
    
    let latitude: Double
    let longitude: Double
    
    init(user: User) { 
        self.latitude = user.latitude
        self.longitude = user.longitude
        }
}
