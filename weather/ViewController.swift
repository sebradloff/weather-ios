//
//  ViewController.swift
//  weather
//
//  Created by Sebastian Radloff on 9/20/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let validator = Validator()
    let weatherService = WeatherService(baseURL: "http://api.openweathermap.org")
    let tempConverter = TempConverter()
    let manager: CLLocationManager! = CLLocationManager()
    var locValue:CLLocationCoordinate2D!
    
    @IBOutlet weak var tempView: UIView!
    
    @IBOutlet weak var zipCodeError: UILabel!
    
    @IBOutlet weak var currentTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        zipCodeError.hidden = true
        tempView.hidden = true
        
        self.manager.requestWhenInUseAuthorization()
        self.manager.requestAlwaysAuthorization()
        
        if (CLLocationManager.locationServicesEnabled()){
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            manager.requestAlwaysAuthorization()
            manager.startUpdatingLocation()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var zipCodeEntered: UITextField!
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        if (validator.validateZipCode(zipCodeEntered.text!)){
            zipCodeError.hidden = true
            zipCodeEntered.resignFirstResponder()
            
            weatherService.fetchZipCodeWeather(zipCodeEntered.text!, completionHandler: { (weather: Dictionary<String,Double>) -> () in
                let tempDictionary: Dictionary<String, Double> = weather
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tempView.hidden = false
                    
                    self.currentTemp.text = self.tempConverter.kelvinToFarenheit(tempDictionary["current_temp"]!) as String
                })
            })

        } else {
            zipCodeError.hidden = false
        }
    }
    
    @IBAction func useCurrentLocation(sender: AnyObject) {
        let latitude = String(locValue.latitude)
        let longitude = String(locValue.longitude)
        
        weatherService.fetchLatLonWeather(latitude, longitude: longitude) { (weather) -> () in
            let tempDictionary: Dictionary<String, Double> = weather
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tempView.hidden = false
                
                self.currentTemp.text = self.tempConverter.kelvinToFarenheit(tempDictionary["current_temp"]!) as String
            })
        }
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locValue = (manager.location?.coordinate)!
        
        print("locations \(locValue.latitude) \(locValue.longitude)")
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
}