//
//  weatherServiceTests.swift
//  weather
//
//  Created by Sebastian Radloff on 9/25/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import Foundation
import XCTest


class TestWeatherService: XCTestCase {
    
    func test_fetchZipCodeWeatherSuccessful() {
        let expectation = expectationWithDescription("fetching weather based on zip code")
        let baseURL = "http://localhost:3535"
        
        let weatherService = WeatherService(baseURL: baseURL)
    
        weatherService.fetchZipCodeWeather("60614", completionHandler: { (weather: Dictionary<String,Double>) -> () in
           
            XCTAssertEqual(294.48, weather["current_temp"]!)
            XCTAssertEqual(293.15, weather["min_temp"]!)
            XCTAssertEqual(296.15, weather["max_temp"]!)
            
            expectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(0.1, handler: nil)
    }
    
    func test_fetchLatLonWeatherSuccessful() {
        let expectation = expectationWithDescription("fetching weather based on lat and lon")
        let baseURL = "http://localhost:3535"
        
        let weatherService = WeatherService(baseURL: baseURL)
        
        weatherService.fetchLatLonWeather("41.9155257345321", longitude: "-87.6512061212324") { (weather) -> () in
            XCTAssertEqual(294.48, weather["current_temp"]!)
            XCTAssertEqual(293.15, weather["min_temp"]!)
            XCTAssertEqual(296.15, weather["max_temp"]!)
            
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(0.1, handler: nil)
    }
}