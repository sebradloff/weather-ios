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
    
    let mb: MountebankTestResource = MountebankTestResource().protocolType("http").imposterPort("3535")
    
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
    
    func test_fetchZipCodeWeatherSuccessfulUsingMb(){
        mb.routeToMatch("/data/2.5/weather").queryParam("zip", value: "60614,us").statusCode(200).responseBody("{\"coord\":{\"lon\":-87.65,\"lat\":41.85},\"weather\":[{\"id\":802,\"main\":\"Clouds\",\"description\":\"scattered clouds\",\"icon\":\"03d\"}],\"base\":\"cmc stations\",\"main\":{\"temp\":294.48,\"pressure\":1021,\"humidity\":40,\"temp_min\":293.15,\"temp_max\":296.15},\"wind\":{\"speed\":4.1,\"deg\":90},\"clouds\":{\"all\":40},\"dt\":1442783512,\"sys\":{\"type\":1,\"id\":961,\"message\":0.004,\"country\":\"US\",\"sunrise\":1442748997,\"sunset\":1442793011},\"id\":4887398,\"name\":\"Chicago\",\"cod\":200}").build()
        
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
}