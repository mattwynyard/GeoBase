//
//  MapController.swift
//  GeoBase
//
//  Created by Matt Wynyard on 9/04/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    let locationManager: CLLocationManager = CLLocationManager()
    //var currentLocation: CLLocation!
    //let locationArray: NSArray!
    var latDelta:CLLocationDegrees = 0.01
    var longDelta:CLLocationDegrees = 0.01
    var span:MKCoordinateSpan?

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        span =  MKCoordinateSpanMake(latDelta, longDelta)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let locationArray = locations as NSArray
        let currentLocation = locationArray.lastObject as! CLLocation
        let latitude: CLLocationDegrees = currentLocation.coordinate.latitude
        let longitude:CLLocationDegrees = currentLocation.coordinate.longitude
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span!)
        
        self.mapView.setRegion(region, animated : true)
        self.mapView.showsUserLocation = true
        
//        var pointLocation  = MKPointAnnotation()
//        pointLocation.coordinate = location
//        pointLocation.title = "current location"
//        
//        self.mapView.addAnnotation(pointLocation)
        
    }

}
