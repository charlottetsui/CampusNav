//
//  NavigationBarOptionModel.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/20/24.
//

import Foundation
import SwiftUI

enum NavigationBarOptionModel: Int, CaseIterable {
    case viewSchedule
    case createSchedule
    case searchCourses
    
    var title: String {
        switch self {
        case .viewSchedule:
            return "View Schedule"
        case .createSchedule:
            return "Create Schedule"
        case .searchCourses:
            return "Search Courses"
        }
    }
    
    var systemImageName: String {
        switch self {
        case .viewSchedule:
            return "list.bullet"
        case .createSchedule:
            return "paperplane"
        case .searchCourses:
            return "magnifyingglass"
        }
    }
    
    @ViewBuilder
    var destinationView: some View {
        switch self {
        case .viewSchedule:
            ViewScheduleView()
        case .createSchedule:
            CreateScheduleView()
                .navigationBarBackButtonHidden(true)
        case .searchCourses:
            CreateScheduleListView()
        }
    }
}

extension NavigationBarOptionModel: Identifiable {
    var id: Int { return self.rawValue }
}
