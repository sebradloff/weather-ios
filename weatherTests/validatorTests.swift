//
//  validatorTests.swift
//  weather
//
//  Created by Sebastian Radloff on 9/20/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import XCTest
@testable import weather

class validatorTests: XCTestCase {
    
    func test_validateZipCodeThatIsCorrectShouldBeTrue(){
        let validator = Validator()
        
        let actual = validator.validateZipCode("60614")
        let expected = true
        
        XCTAssertEqual(actual, expected)
    }
    
    func test_ValidateZipCodeThatIsTooShortShouldBeFalse(){
        let validator = Validator()
        
        let actual = validator.validateZipCode("6061")
        let expected = false
        
        XCTAssertEqual(actual, expected)
    }
    
}
