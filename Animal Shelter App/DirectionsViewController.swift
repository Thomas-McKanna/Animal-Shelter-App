//
//  DirectionsViewController.swift
//  Animal Shelter App
//
//  Created by Thomas McKanna on 11/28/16.
//  Copyright © 2016 ISYS 220. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DirectionsViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    
    @IBOutlet weak var mapView: MKMapView!
    var destination: MKMapItem?
    var locationManager: CLLocationManager = CLLocationManager()
    var userLocation: CLLocation?
    let regionRadius: CLLocationDistance = 1000
    var steps: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // location of the pet shelter
        destination = MKMapItem.init(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 38.664832, longitude: -90.604201)))
        mapView.delegate = self
        locationManager.requestAlwaysAuthorization()
        mapView.showsUserLocation = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestLocation()
    }
    
    // TODO: finish preparing for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "steps" {
            let destination = segue.destination as! StepDirectionsTableViewController
            // if steps has been loaded with data
            if (steps.count != 0) {
                destination.steps = self.steps
            }
            else {
                destination.steps.append("Data has not yet loaded")
            }
        }
    }
    
    func centerMapOn(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0]
        self.getDirections()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func getDirections() {
        
        let request = MKDirectionsRequest()
        request.source = MKMapItem.forCurrentLocation()
        request.destination = destination!
        request.requestsAlternateRoutes = false
        
        let directions = MKDirections(request: request)
        
        directions.calculate(completionHandler: {(response, error) in
            
            if error != nil {
                print("Error getting directions")
            } else {
                self.showRoute(response!)
            }
        })
    }
    
    func showRoute(_ response: MKDirectionsResponse) {
        
        for route in response.routes {
            
            mapView.add(route.polyline,
                         level: MKOverlayLevel.aboveRoads)
            
            steps.removeAll()
            
            for step in route.steps {
                steps.append(step.instructions)
            }
        }
        
        let region =
            MKCoordinateRegionMakeWithDistance(userLocation!.coordinate,
                                               2000, 2000)
        
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, rendererFor
        overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 2.0
        return renderer
    }
    
    
    @IBAction func recalcBtn(_ sender: UIButton) {
        locationManager.requestLocation()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
