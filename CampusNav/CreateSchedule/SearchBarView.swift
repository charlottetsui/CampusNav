//
//  SearchBarView.swift
//  CampusNav2
//
//  Created by Charlotte Tsui on 11/30/24.
//
import SwiftUI

struct SearchBarView: View {
    
    @Binding var search: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(
                    search.isEmpty ?
                    Color.secondary : Color.accentColor
                )
            
            TextField("Search class by name...", text: $search)
                .foregroundColor(Color.accentColor)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .foregroundColor(Color.accentColor)
                        .opacity(search.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            search = ""
                        }
                    , alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white.opacity(0.25))
                .stroke(Color.secondary, lineWidth: 1.5)
        )
    }
}

#Preview {
    SearchBarView(search: .constant(""))
}

