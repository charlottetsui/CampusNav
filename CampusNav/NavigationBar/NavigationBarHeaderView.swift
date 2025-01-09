//
//  NavigationBarHeaderView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/20/24.
//

import SwiftUI

struct NavigationBarHeaderView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        if let user = vm.currentUser {
            HStack {
                Text(user.initials)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 48, height: 48)
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
    }
}

#Preview {
    NavigationBarHeaderView()
        .environmentObject(AuthViewModel())
}
