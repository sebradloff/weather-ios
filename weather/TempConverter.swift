//
//  TempConverter.swift
//  weather
//
//  Created by Sebastian Radloff on 9/26/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import Foundation

public class TempConverter {
    
    func kelvinToFarenheit(kelvinTemp: Double) -> String {
        var farenheitTemp = String(Int(round(kelvinTemp * (9/5) - 459.67)))
        farenheitTemp += " °F"
        return farenheitTemp
    }
}