//
//  MapView.swift
//  BrewBookFinal
//
import SwiftUI
import MapKit


class VenueAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

struct MapView: UIViewRepresentable {
    let region: MKCoordinateRegion
    let annotations: [VenueAnnotation]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.setRegion(region, animated: true)
        mapView.addAnnotations(annotations)
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        view.setRegion(region, animated: true)
        view.addAnnotations(annotations)
    }
}
