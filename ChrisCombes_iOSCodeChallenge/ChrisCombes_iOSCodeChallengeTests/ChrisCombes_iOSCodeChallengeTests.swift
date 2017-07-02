//
//  ChrisCombes_iOSCodeChallengeTests.swift
//  ChrisCombes_iOSCodeChallengeTests
//
//  Created by Christopher Combes on 7/2/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import ChrisCombes_iOSCodeChallenge

class ChrisCombes_iOSCodeChallengeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadingLocalPost() {
        
        if let path = Bundle.main.path(forResource: "example-reddit-data", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try NSData(contentsOf: url, options: NSData.ReadingOptions.uncached)
                let jsonData = JSON(data: data as Data)
                if let query = RedditQuery(json: jsonData) {
                    debugPrint(query)
                } else {
                    XCTFail("Could not parse JSON")
                }
            } catch {
                XCTFail("Error: \(error)")
            }
        }
    }
}
