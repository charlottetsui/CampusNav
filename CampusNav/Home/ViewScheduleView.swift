//
//  UpcomingCourseView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 12/2/24.
//

import SwiftUI

struct ViewScheduleView: View {
    @EnvironmentObject var authvm: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.primary.opacity(0.05).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 10) {
                Text("View Schedule")
                    .font(.title3)
                    .fontWeight(.bold)
                Text("Access and view your course routes below.")
                    .font(.title)
                if !authvm.allCourses.isEmpty {
                    List {
                        ForEach(authvm.allCourses) { route in
                            NavigationLink {
                                MapDetailView(routes: route.routePoints, courses: route.course)
                            } label: {
                                MapView(routes: route.routePoints)
                            }
                            .listRowBackground(Color.clear)
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteRoute(route: route)
                                } label: {
                                    Image(systemName: "trash")
                                }
                                .tint(.red)
                                
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                    .listStyle(.plain)
                } else {
                    VStack(alignment: .leading, spacing: 15) {
                        Image(systemName: "list.number")
                            .resizable()
                            .scaledToFit()
                        Text("No Course Routes Have Been Added")
                            .font(.subheadline)
                            .foregroundColor(Color.secondary)
                    }
                    .padding(.vertical)
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ViewScheduleView()
        .environmentObject(AuthViewModel())
}

extension ViewScheduleView {
    func deleteRoute(route: NewCourse) {
        if let index = authvm.allCourses.firstIndex(of: route) {
            authvm.allCourses.remove(at: index)
        }
    }
}
