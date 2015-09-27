//
//  WeatherJSONParser.swift
//  weather
//
//  Created by Sebastian Radloff on 9/25/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import Foundation

public class WeatherParser {
    
    func parseMinMaxCurrentTemp(input: NSDictionary) -> Dictionary<String, Double>{
        var tempDictionary = Dictionary<String, Double>()

        tempDictionary["current_temp"] = input.valueForKey("main")?.valueForKey("temp")! as? Double
        tempDictionary["min_temp"] = input.valueForKey("main")?.valueForKey("temp_min")! as? Double
        tempDictionary["max_temp"] = input.valueForKey("main")?.valueForKey("temp_max")! as? Double
        return tempDictionary
    }
}