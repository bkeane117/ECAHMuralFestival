//
//  MapView.swift
//  ECAHMuralFestival
//
//  Created by Brendan Keane on 2021-05-21.
//

import SwiftUI
import MapKit

// extension to add a manual MKPointAnnotation for preview
extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympic."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}

struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var showingPlaceDetails: Bool
    @Binding var currentLocation: CLLocationCoordinate2D
    
    // variable array of map locations
    var annotations: [MKPointAnnotation]
    
    //create our map view
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = false // default, but improves readilbility
        //mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 48.437042, longitude: -123.405634)
        //mapView.setCenter(CLLocationCoordinate2D(latitude: 48.437042, longitude: -123.405634), animated: true)
        return mapView
    }
    
    // check to see if the number of annotations in our selected view has changed, if it has, then we update our view with the new annotations
    func updateUIView(_ view: MKMapView, context: Context) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        view.showsUserLocation = true
        //view.setCenter(currentLocation, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent

        }
        
        //keep center coordinates synced and change map visibility areaS
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            //parent.centerCoordinate = mapView.centerCoordinate
            if !mapView.showsUserLocation {
                parent.centerCoordinate = mapView.centerCoordinate
            }
        }
        
        //function to determine the behaviour of the pins/annotations
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Placemark"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                annotationView?.canShowCallout = true
                
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        //tapped the accessory control button on a pin 
        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
            guard let placemark = view.annotation as? MKPointAnnotation else { return }
            parent.selectedPlace = placemark
            //parent.showingPlaceDetails = true
        }
    }

}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: .constant(MKPointAnnotation.example.coordinate), selectedPlace: .constant(MKPointAnnotation.example), showingPlaceDetails: .constant(false), currentLocation: .constant(MKPointAnnotation.example.coordinate), annotations: [MKPointAnnotation.example])
    }
}
