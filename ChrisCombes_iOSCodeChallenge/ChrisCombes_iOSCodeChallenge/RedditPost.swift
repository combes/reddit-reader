//
//  RedditPost.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/2/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import SwiftyJSON

// Applicable JSON Fields
let titleField              = "title"
let authorField             = "author"
let thumbnailField          = "thumbnail"
let numberOfCommentsField   = "num_comments"
let upsField                = "ups"
let downsField              = "downs"

class RedditPost: CustomDebugStringConvertible {
    
    // Applicable JSON fields
    var title = ""
    var author = ""
    var thumbnailURL = ""
    var numberOfComments = 0
    var upPosts  = 0
    var downPosts = 0
    
    var debugDescription: String {
        var description = ""
        description += "Title(\"\(title)\")\n"
        description += "Author(\"\(author)\")\n"
        description += "Thumbnail(\"\(thumbnailURL)\")\n"
        description += "Comments(\"\(numberOfComments)\")\n"
        description += "Up(\"\(upPosts)\")\n"
        description += "Down(\"\(downPosts)\")\n"
        return description
    }
    
    required init?(json: JSON) {
        
        // Start of relevant JSON
        if json == JSON.null {
            return nil
        }
        
        // Parse applicable fields
        title = json[titleField].string ?? ""
        author = json[authorField].string ?? ""
        thumbnailURL = json[thumbnailField].string ?? ""
        numberOfComments = json[numberOfComments].int ?? 0
        upPosts = json[upsField].int ?? 0
        downPosts = json[downsField].int ?? 0
    }
}

