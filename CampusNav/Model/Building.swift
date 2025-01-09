//
//  Building.swift
//  CampusNav2
//
//  Created by Charlotte Tsui on 11/30/24.
//

import Foundation

struct Building {
    let name: String
    let latitude: Double
    let longitude: Double
}

class BuildingCoordinates {
    
    // dictionary for all the building locations of classes
    static let buildings: [String: Building] = [
        "Genome Sciences Bui": Building(name: "Genome Sciences Bui", latitude: 35.907510, longitude: -79.050804),
        "Manning Hall": Building(name: "Manning Hall", latitude: 35.911283, longitude: -79.049256),
        "Sitterson Hall": Building(name: "Sitterson Hall", latitude: 35.909930, longitude: -79.053229),
        "Naval Armory": Building(name: "Naval Armory", latitude: 35.909105, longitude: -79.052810),
        "Stone Center": Building(name: "Stone Center", latitude: 35.907892, longitude: -79.050150),
        "Coker Hall": Building(name: "Coker Hall", latitude: 35.908028, longitude: -79.051239),
        "Hanes Art Center": Building(name: "Hanes Art Center", latitude: 35.912384, longitude: -79.054385),
    ]
    
    static func coordinates(for building: String) -> Building? {
        return buildings[building]
    }
}
