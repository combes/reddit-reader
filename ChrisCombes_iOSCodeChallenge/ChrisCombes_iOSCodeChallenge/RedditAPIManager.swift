//
//  RedditAPIManager.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/3/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import Foundation
import SwiftyJSON

typealias ServiceResponse = (JSON, Error?) -> Void

class RedditAPIManager {
    
    // Use public API feed
    let baseURL = "https://www.reddit.com/r/%@/.json"
    
    /// Request posts matching the specified category.
    ///
    /// - Parameters:
    ///   - category: Category to search for (e.g. "space")
    ///   - onCompletion: Completion method to call once the network responds.
    func postsForCategory(_ category: String, onCompletion: @escaping (JSON) -> Void) {
        // Create full address path using provided category
        let fullAddress = String(format: baseURL, category)
        
        // Encode string for HTTP request
        if let escapedString = fullAddress.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
            makeHTTPGetRequest(path: escapedString, onCompletion: { json, err in
                onCompletion(json as JSON)
            })
        } else {
            onCompletion(JSON.null)
        }
    }
    
    /// Make an HTTP "Get" request to a server.
    ///
    /// - Parameters:
    ///   - path: URL of server
    ///   - onCompletion: Closure called after operation completes. May return JSON.null if no data retrieved.
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if let jsonData = data {
                let json:JSON = JSON(data: jsonData)
                onCompletion(json, error)
            } else {
                onCompletion(JSON.null, error)
            }
        })
        task.resume()
    }
}
