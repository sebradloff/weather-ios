//
//  ViewController.swift
//  weather
//
//  Created by Sebastian Radloff on 9/20/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    let validator = Validator()
    @IBOutlet weak var zipCodeError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        zipCodeError.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var zipCodeEntered: UITextField!
    
    @IBAction func submitButtonPressed(sender: AnyObject) {
        if (validator.validateZipCode(zipCodeEntered.text!)){
            zipCodeError.hidden = true
        } else {
            zipCodeError.hidden = false
        }
    }
    
}