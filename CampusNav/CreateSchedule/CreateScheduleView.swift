//
//  CreateSchedule.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/20/24.
//

import SwiftUI
import MapKit

struct CreateScheduleView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var authvm: AuthViewModel
    @StateObject private var vm = CreateScheduleViewModel()
    @State private var name: String = ""
    @State var showCourseList = false
    @State private var viewUpdated = false
    @State private var mapSelection: MKMapItem?
    @State private var getDirections = false
    @State private var routeDisplaying = false
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapRegion, selection: $mapSelection) {
                if viewUpdated {
                    ForEach(vm.markers) { marker in
                        Marker(marker.name, coordinate: marker.coordinate).tint(Color.accentColor)
                    }
                    
                    
                    ForEach(vm.routes, id: \.self) { polyline in
                        MapPolyline(polyline)
                            .stroke(Color.blue, lineWidth: 4.0)
                    }
                }
                
            }
            .ignoresSafeArea()
            VStack {
                if showCourseList {
                    CreateScheduleListView { course in
                        vm.updateView(latitude: course.latitude ?? 35.9049,
                                      longitude: course.longitude ?? -79.0469)
                        vm.coordinate = CLLocationCoordinate2D(latitude: course.latitude ?? 35.9049,
                                                               longitude: course.longitude ?? -79.0469)
                        name = ("\(course.Subject + " " + course.CatalogNumber)")
                        vm.addMarker(name: name, coordinate: vm.coordinate)
                        authvm.addCourse(course: course)
                        viewUpdated = true
                        
                        withAnimation {
                            showCourseList.toggle()
                        }
                    }
                    .padding(.top, 45)
                    .ignoresSafeArea()
                }
                Spacer()
                HStack(spacing: 35) {
                    // BACK BUTTON
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.backward.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.accentColor.opacity(0.9))
                    }
                    resetButton
                    courseButton
                    routeButton
                    // SAVE BUTTON
                    Button {
                        authvm.saveRoute(route: vm.routes)
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.forward.circle.fill")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color.accentColor.opacity(0.9))
                    }
                }
                .padding(.bottom)
            }
            .padding()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    CreateScheduleView()
        .environmentObject(CreateScheduleViewModel())
}

extension CreateScheduleView {
    
    private var courseButton: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.3)) {
                showCourseList.toggle()
            }
        } label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 55, height: 55)
                .foregroundColor(Color.accentColor.opacity(0.9))
        }
    }
    
    private var routeButton: some View {
        Button {
            vm.fetchRoute()
        } label: {
            Image(systemName: "figure.walk.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.green.opacity(0.9))
        }
    }
    
    private var resetButton: some View {
        Button {
            vm.clearRoutes()
            vm.clearMarkers()
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(Color.red.opacity(0.9))
        }
    }
}

