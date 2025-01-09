    //
//  MapViewModel.swift
//  Pathway
//
//  Created by Charlotte Tsui on 11/20/24.
//

import Foundation
import MapKit
import SwiftUI

class CreateScheduleViewModel: ObservableObject {
    @Published var mapRegion: MapCameraPosition = .region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.906710, longitude: -79.050085), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)))
    @Published var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 35.9049, longitude: -79.0469)
    @Published var latitude: Double = 35.9049
    @Published var longitude: Double = -79.0469
    
    @Published var markers: [MarkerModel] = []
    @Published var routes: [MKPolyline] = []
    
    func updateView(latitude: Double, longitude: Double) {
        withAnimation(.easeInOut) {
            mapRegion = .region(MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.0025, longitudeDelta: 0.0025))
            )
        }
    }
    
    func addMarker(name: String, coordinate: CLLocationCoordinate2D) {
        let marker = MarkerModel(name: name, coordinate: coordinate)
        markers.append(marker)
    }
    
    func fetchRoute() {
        guard markers.count > 1 else { return }

        Task {
            for i in 0..<markers.count - 1 {
                let source = MKMapItem(placemark: .init(coordinate: markers[i].coordinate))
                let destination = MKMapItem(placemark: .init(coordinate: markers[i + 1].coordinate))

                let request = MKDirections.Request()
                request.source = source
                request.destination = destination
                request.transportType = .walking

                do {
                    let result = try await MKDirections(request: request).calculate()
                    if let route = result.routes.first {
                        DispatchQueue.main.async {
                            self.routes.append(route.polyline)
                        }
                    }
                } catch {
                    print("ERROR: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func clearRoutes() {
        routes.removeAll()
    }
    
    func clearMarkers() {
        markers.removeAll()
    }
}


