//
//  Marker.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 12/2/24.
//

import Foundation
import MapKit

struct MarkerModel: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}
