//
//  MountebankTestResource.swift
//  weather
//
//  Created by Sebastian Radloff on 10/1/15.
//  Copyright © 2015 Sebastian Radloff. All rights reserved.
//

import Foundation


public class MountebankTestResource {
    
    private var imposterPort: String = ""
    private var protocolType: String = ""
    private var routeToMatch: String = ""
    private var queryParams: Dictionary<String, String> = Dictionary<String, String>()
    private var responseBody: String = ""
    private var statusCode: Int = 200
    private var methodType: String = "GET"
    
    func imposterPort(imposterPort: String) -> MountebankTestResource {
        self.imposterPort = imposterPort
        return self
    }
    
    func protocolType(protocolType: String) -> MountebankTestResource {
        self.protocolType = protocolType
        return self
    }
    
    func routeToMatch(route: String) -> MountebankTestResource {
        self.routeToMatch = route
        return self
    }
    
    func queryParam(key: String, value: String) -> MountebankTestResource {
        self.queryParams[key] = value
        return self
    }
    
    func responseBody(responseBody: String) -> MountebankTestResource {
        self.responseBody = responseBody
        return self
    }
    
    func statusCode(statusCode: Int) -> MountebankTestResource {
        self.statusCode = statusCode
        return self
    }
    
    func methodType(methodType: String) -> MountebankTestResource {
        self.methodType = methodType
        return self
    }
    
    func build(){
        let urlString = "http://localhost:2525"
        let url = NSURL(string: urlString)!
        let request = NSMutableURLRequest(URL: url)
        
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.HTTPBody = createStub()
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
        }
        
        task.resume()
    }
    
    private func createStub() -> NSData {
        let imposterPortString = "\"port\": " + self.imposterPort
        let protocolString = "\"protocol\": \"" + self.protocolType + "\""
        let queryString = createQueryParamKeyValueString()
        let stubsString = "\"stubs\": [{\"predicates\": [{\"equals\": {\"path\": \"" + self.routeToMatch + "\", \"method\": \"" + self.methodType + "\", \"query\": {" + queryString + "}}}], \"responses\": [ { \"is\": { \"body\": " + self.responseBody + "}}]}]"
        
        let completeStub: NSString = "{" + imposterPortString + "," + protocolString + "," + queryString + "," + stubsString + "}"
        return completeStub.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
    private func createQueryParamKeyValueString() -> String{
        var queryString: String = ""
        for (key, value) in self.queryParams {
            queryString += ("\"" + key + "\": \"" + value + "\",")
        }
        return queryString.substringToIndex(queryString.endIndex.predecessor())
    }
    
}