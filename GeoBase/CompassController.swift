//
//  CompassControllerViewController.swift
//  GeoBase
//
//  Created by Matt Wynyard on 4/04/15.
//  Copyright (c) 2015 Niobium. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion
import MapKit
import CoreData

@objc(CompassController)
class CompassController: UIViewController, CLLocationManagerDelegate,
                            MKMapViewDelegate {

    @IBOutlet weak var strikeLabel: UILabel!
    @IBOutlet weak var dipLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var horizontalAccuracy: UILabel!
    @IBOutlet weak var pitchLabel: UILabel!
    //@IBOutlet weak var yawLabel: UILabel!
    @IBOutlet weak var structSelector: UISegmentedControl!
    @IBOutlet weak var structLabel: UILabel! //Strike or Trend
    @IBOutlet weak var struct2Label: UILabel! //Dip or plunge
    @IBOutlet weak var headingLabel: UILabel!
    
    let locationManager: CLLocationManager = CLLocationManager()
    let motionManager: CMMotionManager = CMMotionManager()
    let date = NSDate()
    //let calendar = NSCalendar()
    var startLocation: CLLocation!
    var currentLocation: CLLocation!
    var locationArray: NSArray! //array holding location data
    var heading: Double! // strike value used for calculations
    var strikeInt32: Int32! // 32bit strike value for database
    var dip: String! //dip value for user interface
    var direction = " " //dip direction
    var dipInt32: Int32 = 0 // 32 bit absolute dip value for database
    var dipDouble: Double = 0.0 // not absolute value used for direction calculations
    var pitch: Double = 0.0
    //let ref = CMAttitudeReferenceFrameXArbitraryZVertical
    var useTrueNorth: Bool = true
    var currentProject = NSUserDefaults.standardUserDefaults().stringForKey("currentProject")

    
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch structSelector.selectedSegmentIndex {
        case 0:
            structLabel.text = "Trend";
            struct2Label.text = "Plunge";
        case 1:
            structLabel.text = "Strike";
            struct2Label.text = "Dip";
        default:
            break; 
        }
    }
    
    /* Function called when the record button is pushed
    * @param AnyObject the record button
    */
    @IBAction func recordButton(sender: AnyObject) {
        
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Data", inManagedObjectContext: context)
        
        let newRecord = DataModel(entity: entity!, insertIntoManagedObjectContext: context)
        let message: String = "\(structLabel.text!): \(strikeLabel.text!)/\(dipLabel.text!)"
        
        newRecord.date = printTimestamp()
        newRecord.dip = dipInt32
        newRecord.direction = direction
        newRecord.elevation = currentLocation.altitude
        
        newRecord.latitude = currentLocation.coordinate.latitude
        newRecord.longitude = currentLocation.coordinate.longitude
        newRecord.strike = strikeInt32
        
        if useTrueNorth == true {
            newRecord.north = "true"
        } else {
            newRecord.north = "magnetic"
        }
        
        print(newRecord)
        //newRecord.structure
        
        
        let alertController = UIAlertController(title: "Save to Database", message: message , preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
        
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
        structLabel.text = "Strike"
        struct2Label.text = "Dip"
        
        structSelector.selectedSegmentIndex = 1 // strike/dip
        useTrueNorth = NSUserDefaults.standardUserDefaults().boolForKey("northSwitch");
        
        if useTrueNorth == true {
            print("on")
            headingLabel.text = "True North"
        } else {
            print("off")
            headingLabel.text = "Magnetic North"
        }
        
        if CLLocationManager.headingAvailable() {
            
            locationManager.headingFilter = 0.5 //take new reading tolerance +/- degree change
            locationManager.headingOrientation = .Portrait
            locationManager.startUpdatingHeading()
            startMotion()
        }
       
         print(currentProject)
    }
    
    /** LOCATION MANAGER FUNCTIONS */
    //*****************************************************
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        self.locationArray = locations as NSArray //array to hold GPS readings
        self.currentLocation = locationArray.lastObject as! CLLocation
        
        latitudeLabel.text = String(format: "%+.4f", currentLocation.coordinate.latitude) + "\u{00B0}" //degrees
        //longitudeLabel.text = String(format: "%+.4f", currentLocation.coordinate.longitude) + "\u{00B0}"
        horizontalAccuracy.text = "\u{00B1}" + String(format: "%.1f", currentLocation.horizontalAccuracy) + " m"
        //elevationLabel.text = String(format: "%+.2f", currentLocation.altitude) + " m"
        //accuracyVerticalLabel.text = "\u{00B1}" + String(format: "%.1f", currentLocation.verticalAccuracy) + " m"
        
        if startLocation == nil {
            startLocation = currentLocation as CLLocation
        }
        
        var distanceBetween: CLLocationDistance = currentLocation.distanceFromLocation(startLocation)
        
        //distanceLabel.text = String(format: "%.2f", distanceBetween)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateHeading currentHeading: CLHeading) {
        
        var magHeading = currentHeading.magneticHeading
        var trueHeading = currentHeading.trueHeading // will be -1 if we have no location info
        var headingAccuracy = currentHeading.headingAccuracy
        
        if useTrueNorth {
            heading = currentHeading.trueHeading
        } else {
            heading = currentHeading.magneticHeading
        }
        strikeInt32 = Int32(round(heading))
        dipInt32 = Int32(round(dipDouble))
        
        if (structSelector.selectedSegmentIndex == 1) {
            strikeLabel.text = String(format: "%03.f", heading) + "\u{00B0}"
            direction = setDirection(heading, roll: dipDouble)
            
        } else if (pitch < 0){
           strikeLabel.text = String(format: "%03.f", (heading) % 360) + "\u{00B0}"
        } else {
            strikeLabel.text = String(format: "%03.f", (heading + 180) % 360) + "\u{00B0}"
        }
        
    }
    
    /* Gets the dip direction of the reading
    *
    * @param heading - equivalent to strike
    * @param roll - equivalent to dip
    * @return String with dip direction
    */
    func setDirection(heading: Double, roll: Double) -> String {
        
        if (heading >= 347.5 && heading <= 360) || (heading >= 0 && heading < 22.5){
            if roll < 0 {
                return "W"
            } else {
                return "E"
            }
        } else if heading >= 22.5 && heading < 67.5 {
            if roll < 0 {
                return "NW"
            } else {
                return "SE"
            }
        } else if heading >= 67.5 && heading < 112.5 {
            if roll < 0 {
                return "N"
            } else {
                return "S"
            }
        } else if heading >= 112.5 && heading < 157.5 {
            if roll < 0 {
                return "NE"
            } else {
                return "SW"
            }
        } else if heading >= 157.5 && heading < 202.5 {
            if roll < 0 {
                return "E"
            } else {
                return "W"
            }
        } else if heading >= 202.5 && heading < 247.5 {
            if roll < 0 {
                return "SE"
            } else {
                return "NW"
            }
        } else if heading >= 247.5 && heading < 292.5 {
            if roll < 0 {
                return "S"
            } else {
                return "N"
            }
        } else if heading >= 292.5 && heading < 347.5 {
            if roll < 0 {
                return "SW"
            } else {
                return "NE"
            }
        } else {
            return "error"
        }
    }
    
    /* 
    * Function to get current date and time
    * @return String: the current date and time
    */
    func printTimestamp() -> String {
        
        let date = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let timestamp = formatter.stringFromDate(date)
        
        return timestamp
    }
    
    func getLatitude() -> CLLocationDegrees {
        
        let location = locationArray.lastObject as! CLLocation
        return location.coordinate.latitude
    }
    
    func getLongitude() -> CLLocationDegrees {
        
        let location = locationArray.lastObject as! CLLocation
        return location.coordinate.longitude
    }
    
    // *************************************
    // start device motion capture
    // *************************************
    func startMotion() {
        
        let queue = NSOperationQueue.currentQueue()
        
        if motionManager.deviceMotionAvailable {
            
            motionManager.deviceMotionUpdateInterval = 0.1 //update every 0.1 second
    
            motionManager.startDeviceMotionUpdatesUsingReferenceFrame(CMAttitudeReferenceFrame.XArbitraryZVertical, toQueue: queue!, withHandler: {
                (data: CMDeviceMotion?, error: NSError?) -> Void in
                
                self.pitch = (data!.attitude.pitch * 180) / M_PI
                //let yaw = (data!.attitude.yaw * 180) / M_PI
                let roll = (data!.attitude.roll * 180) / M_PI
                //self?.yawLabel.text = String(format: "%.1f", yaw)
                
                if (self.structSelector.selectedSegmentIndex == 1) { //strike/dip segmented control selected
                    
                    //println(data.attitude.roll) //need to fix dip going over 90deg
                    
                    self.dipDouble = (data!.attitude.roll * 180) / M_PI
                    self.dip = String(format: "%.1f", data!.attitude.roll)
                    self.dipLabel.text = String(format: "%.f", abs(self.dipDouble))
                        + " " + self.direction
                    self.pitchLabel.text = String(format: "%.1f", self.pitch)
                    
                } else { //trend/plunge
                    
                    self.dipDouble = (data!.attitude.pitch * 180) / M_PI
                    self.dip = String(format: "%.1f", data!.attitude.pitch)
                    self.dipLabel.text = String(format: "%.f", abs(self.dipDouble))
                    self.pitchLabel.text = String(format: "%.1f", roll)
                }
                })
        }
        NSOperationQueue.mainQueue().addOperationWithBlock {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManagerShouldDisplayHeadingCalibration(manager: CLLocationManager) -> Bool {
        
        return true // if you want the calibration dialog to be able to appear
    }
    
    /* ERRORS */
    //********************************************************
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        
        //TODO error box
    }
    

}
