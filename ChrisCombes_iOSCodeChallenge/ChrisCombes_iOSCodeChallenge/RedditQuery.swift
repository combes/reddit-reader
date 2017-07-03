//
//  RedditQuery.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/2/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import SwiftyJSON

// Initial JSON Fields
let dataField           = "data"
let childrenField       = "children"
let postDataField       = "data"

class RedditQuery {

    var redditPosts = [RedditPost]()
    
    required init?(json: JSON) {
        
        // Start of relevant JSON
        if json == JSON.null {
            return nil
        }
        
        // Find top-level data where data begins
        let data = json[dataField]
        if data == JSON.null {
            return nil
        }
        
        // Parse children which are the individual posts
        let posts = data[childrenField]
        for (_, post):(String, JSON) in posts {
            let postData = post[postDataField]
            if let redditContents = RedditPost(json: postData) {
                redditPosts.append(redditContents)
            }
        }
    }
}

