//
//  CourseListView.swift
//  CampusNav2
//
//  Created by Charlotte Tsui on 11/30/24.
//

import SwiftUI
import MapKit

struct CreateScheduleListView: View {
    @ObservedObject var data = JSONParser()
    @State private var searchCourse = ""
    var onCourseSelected: ((Course) -> Void)?
    
    var body: some View {
        VStack() {
            SearchBarView(search: $searchCourse)
            // limit users to 15 courses at a time so their phone will not explode
            ScrollView {
                ForEach(filteredCourses.prefix(15)) { course in
                    Button {
                        onCourseSelected?(course)
                    } label: {
                        CreateScheduleDetailView(subject: course.Subject, catalogNumber: course.CatalogNumber, classSection: course.ClassSection, description: course.Description, schedule: course.Schedule, room: course.Room, instructor: course.Instructor, coordinate: CLLocationCoordinate2D(latitude: course.latitude ?? 0.0, longitude: course.longitude ?? 0.0))
                    }
                    .buttonStyle(.plain)
                }
                Text("\(filteredCourses.count) results found")
                    .font(.headline)
                    .padding(.vertical)
            }
            .scrollIndicators(.hidden)
        }
        .padding()
    }
}

#Preview {
    CreateScheduleListView()
}

extension CreateScheduleListView {
    var filteredCourses: [Course] {
        // had errors earlier, implement to avoid problems with subject and catalog being treated as seperate terms
        let searchTerms = searchCourse.lowercased().split(separator: " ").map { String($0) }
        
        return data.courses.filter { course in
            var isMatching = true
            
            if let subjectSearch = searchTerms.first, !subjectSearch.isEmpty {
                isMatching = isMatching && course.Subject.lowercased().contains(subjectSearch)
            }
            if searchTerms.count > 1, let catalogSearch = searchTerms.last, !catalogSearch.isEmpty {
                isMatching = isMatching && course.CatalogNumber.lowercased().contains(catalogSearch)
            }
            return isMatching
        }
    }
}
