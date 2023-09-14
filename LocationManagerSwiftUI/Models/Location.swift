//
//  Location.swift
//  LocationManagerSwiftUI
//
//  Created by Ravikanth Thummala on 9/13/23.
//

import Foundation
import MapKit

struct Location:Identifiable,Equatable {
    //MARK: Properties
    let name:String
    let cityName: String
    let coordinate: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link:String
    
    // MARK: Identifiable
    var id:String {
        // Gerate a unique ID by combining name and city name
        name + cityName
    }
    
    
    // MARK: Equatable
    static func  == (lhs: Location, rhs:Location) -> Bool{
        // Compare location by their unique IDS
        lhs.id == rhs.id
    }
}
