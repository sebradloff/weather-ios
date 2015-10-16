//
//  WeatherService.swift
//  weather
//
//  Created by Sebastian Radloff on 9/20/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import Foundation

public class WeatherService {
    var baseURL: String
    let baseAPIURL =  "/data/2.5/weather?"
    let obfuscatedApiKey: String = "3861363736626634333938646666363935363363326538626461346238613338"
    
    init(baseURL: String){
        self.baseURL = baseURL
    }
    
    func fetchZipCodeWeather(zipCode: String, completionHandler: (weather: Dictionary<String, Double>)->()) {
        let config =  NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let stringURL = self.baseURL + baseAPIURL + "zip=" + zipCode + ",us"
        let url = NSURL(string: stringURL)!
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { data, response, downloadError in
            do {
                let parsedJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                
                let tempDictionary: Dictionary<String, Double> = WeatherParser().parseMinMaxCurrentTemp(parsedJSON)

                completionHandler(weather: tempDictionary)
            } catch let caught as NSError {
                print(caught)

            }
        }
        task.resume()
    }
    
    func fetchLatLonWeather(latitude: String, longitude: String, completionHandler: (weather: Dictionary<String, Double>) -> ()) {
        let config =  NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: config)
        
        let stringURL = self.baseURL + baseAPIURL + "lat=" + latitude + "&" + "lon=" + longitude
        let url = NSURL(string: stringURL)!
        let request = NSURLRequest(URL: url)
        
        let task = session.dataTaskWithRequest(request) { data, response, downloadError in
            do {
                let parsedJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
                
                let tempDictionary: Dictionary<String, Double> = WeatherParser().parseMinMaxCurrentTemp(parsedJSON)
                
                completionHandler(weather: tempDictionary)
            } catch let caught as NSError {
                print(caught)
                
            }
        }
        task.resume()
    }
    
    private func nonObfuscate() -> String {
        var sb = ""
        var temp = ""
        
//        let myString = "Hello World"
//        let myRange = Range<String.Index>(start: myString.startIndex, end: myString.startIndex.advancedBy(5))
        
        for (var i = 0; i < (obfuscatedApiKey.characters.count - 1) ; i+=2){
            var output = obfuscatedApiKey[obfuscatedApiKey.startIndex.advancedBy(i)..<obfuscatedApiKey.startIndex.advancedBy(i+2)]
            var decimal = 
        }
        return ""
    }
    
}