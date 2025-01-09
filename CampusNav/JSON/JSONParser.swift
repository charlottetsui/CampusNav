//
//  CourseParser.swift
//  CampusNav2
//
//  Created by Charlotte Tsui on 11/30/24.
//

import Foundation

class JSONParser: ObservableObject {
    @Published var courses = [Course]()
    
    init() {
        loadCourses(from: "aero_courses")
        loadCourses(from: "comp_courses")
        loadCourses(from: "data_courses")
        loadCourses(from: "biol_courses")
    }
    
    func loadCourses(from filename: String) {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json")
        else {
            print("Failed to locate \(filename)")
            return
        }
        do {
            // must attempt to decode file, otherwise catch any errors
            let data = try? Data(contentsOf: url)
            let decodedCourses =  try JSONDecoder().decode([Course].self, from: data!)
            self.courses.append(contentsOf: decodedCourses)
        } catch {
            print("Failed to decode \(filename)")
        }
    }
}
