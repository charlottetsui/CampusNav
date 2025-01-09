//
//  CourseDetailView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/30/24.
//

import SwiftUI
import MapKit

struct CreateScheduleDetailView: View {
    let subject: String
    let catalogNumber: String
    let classSection: String
    let description: String
    let schedule: String
    let room: String
    let instructor: String
    @State private var randomColor: Color = Color(
            red: Double.random(in: 0.7...0.9),
            green: Double.random(in: 0.7...0.9),
            blue: Double.random(in: 0.7...0.9)
        )
    
    let coordinate: CLLocationCoordinate2D
    @EnvironmentObject var vm: CreateScheduleViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack { // COMP 110 002
                Text(subject)
                Text(catalogNumber)
                Text(classSection)
                Spacer()
            }
            .font(.title)
            .fontWeight(.bold)
            HStack { // Intro Programming
                Text(description)
            }
            .font(.subheadline)
            .foregroundColor(Color.secondary)
            HStack { // MWF 11:15 AM-12:05 PM
                Image(systemName: "timer")
                Text(schedule)
                    .font(.subheadline)
            }
            HStack { // Genome Sciences Bui-Rm G100
                Image(systemName: "building")
                Text(room)
                    .font(.subheadline)
            }
            HStack { // Hinks, Isabella Rose
                Image(systemName: "person.circle")
                Text(instructor)
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(randomColor.opacity(0.9))
        .cornerRadius(15)
    }
}

#Preview {
    CreateScheduleDetailView(subject: "COMP", catalogNumber: "110", classSection: "002", description: "Intro Programming", schedule: "MWF 11:15 AM-12:05 PM", room: "Genome Sciences Bui-Rm G100", instructor: "Hinks, Isabella Rose", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0))
        .environmentObject(CreateScheduleViewModel())
}
