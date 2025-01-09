//
//  NavigationBarRowView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/20/24.
//

import SwiftUI

struct NavigationBarRowView: View {
    let option: NavigationBarOptionModel
    @Binding var selectedOption: NavigationBarOptionModel?
    
    private var isSelected: Bool {
        selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            Text(option.title)
                .font(.subheadline)
        }
        .foregroundStyle(isSelected ? Color.accentColor : Color.primary)
        .frame(maxWidth: .infinity, maxHeight: 52, alignment: .leading)
        .background(isSelected ? Color.accentColor.opacity(0.3) : .clear)
        .cornerRadius(15)
    }
}

#Preview {
    NavigationBarRowView(option: .searchCourses, selectedOption: .constant(.searchCourses))
}
