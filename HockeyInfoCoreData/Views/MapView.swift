//
//  MapView.swift
//  HockeyInfoSwiftUI
//
//  Created by Larry Burris on 6/30/19.
//  Copyright © 2019 Larry Burris. All rights reserved.
//
import SwiftUI
import MapKit

struct MapView: UIViewRepresentable
{
    var venue: Venue
    
    func makeUIView(context: Context) -> MKMapView
    {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context)
    {
        let coordinate = CLLocationCoordinate2D(latitude: venue.latitude, longitude: venue.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

struct MapView_Preview: PreviewProvider
{
    static var previews: some View
    {
        MapView(venue: Venue.allVenues()[14])
    }
}
