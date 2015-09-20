//
//  weatherUITests.swift
//  weatherUITests
//
//  Created by Sebastian Radloff on 9/20/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import XCTest

class weatherUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldShowWeatherForZipCodeEntered() {
        let app = XCUIApplication()
        let zipCodeTextField = app.textFields["zipCodeEntered"]
        zipCodeTextField.tap()
        zipCodeTextField.typeText("60614")
        app.buttons["submitZipCodeButton"].tap()
    }
    
    func testShouldShowZipCodeErrorMessageWhenNonValidZipCodeIsEntered() {
        let app = XCUIApplication()
        let zipCodeTextField = app.textFields["zipCodeEntered"]
        
        zipCodeTextField.tap()
        zipCodeTextField.typeText("6061")
        app.buttons["submitZipCodeButton"].tap()
        
        XCTAssert(app.staticTexts["Please enter a valid 5 digit Zip Code!"].exists)
    }
    
}
