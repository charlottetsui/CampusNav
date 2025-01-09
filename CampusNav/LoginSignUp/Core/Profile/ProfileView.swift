//
//  ProfileView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/19/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        if let user = vm.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 70, height: 70)
                            .background(Color.accentColor)
                            .clipShape(Circle())
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.headline)
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(Color.secondary)
                        }
                    }
                }
                
                Section {
                    SettingsRowView(imageName: "person.circle.fill", title: "My Account", description: "Make changes to your acount", color: Color.secondary)
                    SettingsRowView(imageName: "person.circle.fill", title: "My Account", description: "Make changes to your acount", color: Color.secondary)
                    SettingsRowView(imageName: "person.circle.fill", title: "My Account", description: "Make changes to your acount", color: Color.secondary)
                    SettingsRowView(imageName: "person.circle.fill", title: "My Account", description: "Make changes to your acount", color: Color.secondary)
                }
                .listRowSeparator(.hidden)
                
                Section {
                    Button {
                        vm.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill", title: "Log Out", description: "Secure your account", color: Color.secondary)
                    }
                    Button {
                        print("Delete Account")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill", title: "Delete Account", description: "Your information will be gone forever", color: Color.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
