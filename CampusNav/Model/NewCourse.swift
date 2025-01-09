//
//  NewRoute.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 12/2/24.
//

import Foundation
import MapKit
import SwiftUI

struct NewCourse: Identifiable, Hashable {
    let id = UUID()
    let routePoints: [MKPolyline]
    let course: [Course]
    
    static func == (lhs: NewCourse, rhs: NewCourse) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
