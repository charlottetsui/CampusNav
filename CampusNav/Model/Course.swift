//
//  Course.swift
//  CampusNav2
//
//  Created by Charlotte Tsui on 11/30/24.
//

import Foundation

struct Course: Codable, Identifiable {
    
    // map property names to the JSON key names
    enum CodingKeys: String, CodingKey {
        case Subject
        case CatalogNumber = "Catalog Number"
        case ClassSection = "Class Section"
        case ClassNumber = "Class Number"
        case Description
        case Term
        case Hours
        case MeetingDates = "Meeting Dates"
        case Schedule
        case Room
        case InstructionType = "Instruction Type"
        case Instructor
    }
    
    var id = UUID()
    var Subject: String
    var CatalogNumber: String
    var ClassSection: String
    var ClassNumber: String
    var Description: String
    var Term: String
    var Hours: String
    var MeetingDates: String
    var Schedule: String
    var Room: String
    var InstructionType: String
    var Instructor: String
    var latitude: Double? {
        return buildingCoordinates?.latitude
    }
    var longitude: Double? {
        return buildingCoordinates?.longitude
    }
    
    // extract building names by removing the room number
    private func extractBuildingName(from room: String) -> String {
        let components = room.split(separator: "-")
        return String(components.first ?? "")
    }
    
    // fetch coordinates from our dictionary
    var buildingCoordinates: (latitude: Double, longitude: Double)? {
        let buildingName = extractBuildingName(from: Room)
        guard let building = BuildingCoordinates.coordinates(for: buildingName) else { return nil }
        return (building.latitude, building.longitude)
    }
}


