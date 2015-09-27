//
//  Validator.swift
//  weather
//
//  Created by Sebastian Radloff on 9/20/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import Foundation

public class Validator : NSObject {
    
    func validateZipCode(zipCode: String)-> Bool{
        if (zipCode.characters.count == 5){
            return true
        } else {
            return false
        }
    }
}
