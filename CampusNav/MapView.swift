//
//  UpcomingCoursesView.swift
//  CampusNav
//
//  Created by Charlotte Tsui on 11/20/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    let routes: [MKPolyline]
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.white
            Map {
                ForEach(routes, id: \.self) { polyline in
                    MapPolyline(polyline)
                        .stroke(Color.blue, lineWidth: 4.0)
                }
            }
            .frame(width: 330, height: 180)
            .cornerRadius(10)
            .shadow(radius: 1.25)
        }
        .frame(width: 360, height: 205)
        .cornerRadius(15)
        .padding(5)
    }
}

#Preview {
    MapView(routes: [])
}
