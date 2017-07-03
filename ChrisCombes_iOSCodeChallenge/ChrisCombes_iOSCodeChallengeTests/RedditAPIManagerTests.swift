//
//  RedditAPIManagerTests.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/3/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import ChrisCombes_iOSCodeChallenge

class RedditAPIManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPICall() {
        
        // We need to test an asynchronous callback
        let e = expectation(description: "Weather API")

        RedditAPIManager().postsForCategory("funny") { (json) in
            XCTAssert(json != JSON.null, "Failed to retrieve JSON")
            print(json)
            e.fulfill()
        }
        
        // Wait for expectation to be fulfilled
        waitForExpectations(timeout: 2) { (error) in
            if let error = error {
                XCTFail(error.localizedDescription)
            }
        }
    }
}
