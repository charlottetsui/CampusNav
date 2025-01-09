//
//  ContentView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/18/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: AuthViewModel
    
    var body: some View {
        Group {
            if vm.userSession != nil {
                HomeScreenView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
