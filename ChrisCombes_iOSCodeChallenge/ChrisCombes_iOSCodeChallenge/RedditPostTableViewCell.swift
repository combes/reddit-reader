//
//  RedditPostTableViewCell.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/3/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import UIKit

class RedditPostTableViewCell: UITableViewCell {
    
    static let identifier = "redditCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var downsLabel: UILabel!
 
    func configureCellWithRedditPost(_ post: RedditPost) {

        if !post.thumbnailURL.isEmpty {
            
        }
        
        usernameLabel.text = post.author
        titleLabel.text = post.title
        commentsLabel.text = String(format: "%d Comments", post.numberOfComments)
        upsLabel.text = String(format: "%d Ups", post.upPosts)
        downsLabel.text = String(format: "%d Downs", post.downPosts)
    }
}
