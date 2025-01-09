//
//  SettingsRowView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/19/24.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let description: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .resizable()
                .frame(width: 37, height: 37)
                .foregroundColor(color)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color.primary)
                Text(description)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
        }
        .padding(.vertical, 10)
    }
}

#Preview {
    SettingsRowView(imageName: "person.circle.fill", title: "My Account", description: "Make changes to your account", color: Color.secondary)
}
