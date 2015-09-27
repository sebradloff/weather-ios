//
//  converterTests.swift
//  weather
//
//  Created by Sebastian Radloff on 9/26/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import Foundation
import XCTest


class ConverterTests: XCTestCase {
    
    func test_convertKelvinToFarenheitRoundUp() {
        let tempConverter = TempConverter()
        
        let farenheitTemp = tempConverter.kelvinToFarenheit(294.6)
        
        XCTAssertEqual(farenheitTemp, "71 °F" )
    }
    
    func test_convertKelvinToFarenheitRoundDown() {
        let tempConverter = TempConverter()
        
        let farenheitTemp = tempConverter.kelvinToFarenheit(294.5)
        
        XCTAssertEqual(farenheitTemp, "70 °F" )
    }
}