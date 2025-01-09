//
//  MapDetailView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 12/2/24.
//

import SwiftUI
import MapKit

struct MapDetailView: View {
    @EnvironmentObject var authvm: AuthViewModel
    let routes: [MKPolyline]
    let courses: [Course]
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Your Route Summary")
                    .font(.title3)
                    .fontWeight(.semibold)
                Map {
                    ForEach(routes, id: \.self) { polyline in
                        MapPolyline(polyline)
                            .stroke(Color.blue, lineWidth: 4.0)
                    }
                }
                .frame(width: 350, height: 225)
                .cornerRadius(10)
                .shadow(radius: 1.25)
                .padding(.bottom)
            }
            
            Divider()
            
            ScrollView {
                ForEach(courses) { course in
                    CreateScheduleDetailView(subject: course.Subject, catalogNumber: course.CatalogNumber, classSection: course.ClassSection, description: course.Description, schedule: course.Schedule, room: course.Room, instructor: course.Instructor, coordinate: CLLocationCoordinate2D(latitude: course.latitude ?? 0.0, longitude: course.longitude ?? 0.0))
                }
            }
            .scrollIndicators(.hidden)
            .padding(.top)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    MapDetailView(routes: [], courses: [Course(id: UUID(), Subject: "sub", CatalogNumber: "num", ClassSection: "sec", ClassNumber: "num", Description: "dep", Term: "term", Hours: "hours", MeetingDates: "date", Schedule: "sched", Room: "room", InstructionType: "type", Instructor: "inst")])
}
