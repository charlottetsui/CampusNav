//
//  MainView.swift
//  Pathway
//
//  Created by Charlotte Tsui on 11/20/24.
//

import SwiftUI
import MapKit

struct HomeScreenView: View {
    @EnvironmentObject var vm: AuthViewModel
    @State private var showBar = false
    
    var body: some View {
        if let user = vm.currentUser {
            NavigationStack {
                ZStack {
                    Color.primary.opacity(0.05).ignoresSafeArea()
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 25) {
                            VStack(alignment: .leading) {
                                // header HStack
                                HStack {
                                    Button {
                                        showBar.toggle()
                                    } label: {
                                        Image(systemName: "line.3.horizontal")
                                            .resizable()
                                            .frame(width: 19, height: 13)
                                    }
                                    
                                    Text("Welcome back,")
                                        .font(.subheadline)
                                        .foregroundColor(Color.secondary)
                                    Text(user.fullname)
                                        .font(.headline)
                                        .foregroundStyle(Color.accentColor)
                                    Spacer()
                                    Text(user.initials)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                        .frame(width: 37, height: 37)
                                        .background(Color.accentColor)
                                        .clipShape(Circle())
                                }
                                VStack(alignment: .leading) {
                                    Text("\(DateHelper.currentMonthAndDay),")
                                        .font(.system(size: 50)) // not dynamic, fix later
                                    Text(DateHelper.currentDayOfWeek)
                                        .font(.title)
                                        .foregroundStyle(Color.secondary)
                                }
                                MapView(routes: [])
                            }
                            .padding()
                            .padding(.top, 35)
                            UpcomingCoursesView()
                                .cornerRadius(25)
                                .shadow(radius: 1.0)
                            Spacer()
                        }
                    }
                    .scrollIndicators(.hidden)
                    .padding(.top) // adjust padding for better alignment
                    NavigationBarView(isShowing: $showBar)
                }
                .ignoresSafeArea()
                .navigationBarHidden(true)
            }
        }
    }
}


#Preview {
    let mockViewModel = AuthViewModel()
    mockViewModel.currentUser = User.MOCK_USER
    return HomeScreenView()
        .environmentObject(mockViewModel)
}
