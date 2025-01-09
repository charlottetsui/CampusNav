//
//  NavigationBarView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/20/24.
//

import SwiftUI

struct NavigationBarView: View {
    @Binding var isShowing: Bool
    @State private var selectedOption: NavigationBarOptionModel?
    
    var body: some View {
        ZStack {
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                
                HStack {
                    VStack(alignment: .leading, spacing: 13) {
                        NavigationLink {
                            ProfileView()
                        } label: {
                            NavigationBarHeaderView()
                        }
                        .padding(.top, 50)
                        .padding(.bottom)
                        
                        Divider()
                        
                        VStack(alignment: .leading) {
                            ForEach(NavigationBarOptionModel.allCases) { option in
                                NavigationLink {
                                    option.destinationView
                                } label: {
                                    NavigationBarRowView(option: option, selectedOption: $selectedOption)
                                }
                                .onTapGesture {
                                    selectedOption = option
                                    isShowing = false
                                }
                            }
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .frame(width: 285)
                    .background(Color.white)
                    
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .transition(.move(edge: .leading))
        .animation(.easeInOut, value: isShowing)
    }
}

#Preview {
    NavigationBarView(isShowing: .constant(true))
        .environmentObject(AuthViewModel())
}
