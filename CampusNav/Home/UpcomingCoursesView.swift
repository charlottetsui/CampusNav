//
//  UpcomingCoursesView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 12/2/24.
//

import SwiftUI
import MapKit

struct UpcomingCoursesView: View {
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Upcoming Courses")
                    .foregroundColor(Color.secondary)
                    .font(.headline)
                CreateScheduleDetailView(subject: "COMP", catalogNumber: "301", classSection: "001", description: "Intro Programming", schedule: "MWF 9:05AM - 9:55AM", room: "Genome", instructor: "Izzi Hinks", coordinate: CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469))
                CreateScheduleDetailView(subject: "MATH", catalogNumber: "232", classSection: "001", description: "Intro Programming", schedule: "MWF 9:05AM - 9:55AM", room: "Genome", instructor: "Izzi Hinks", coordinate: CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469))
                CreateScheduleDetailView(subject: "COMP", catalogNumber: "211", classSection: "001", description: "Intro Programming", schedule: "MWF 9:05AM - 9:55AM", room: "Genome", instructor: "Izzi Hinks", coordinate: CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469))
                CreateScheduleDetailView(subject: "DATA", catalogNumber: "110", classSection: "001", description: "Intro Programming", schedule: "MWF 9:05AM - 9:55AM", room: "Genome", instructor: "Izzi Hinks", coordinate: CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469))
            }
            .padding(25)
        }
    }
}

#Preview {
    UpcomingCoursesView()
}
