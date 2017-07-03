//
//  RedditPostTableViewCell.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/3/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import UIKit
import SDWebImage

class RedditPostTableViewCell: UITableViewCell {
    
    static let identifier = "redditCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    @IBOutlet weak var downsLabel: UILabel!
    
    func configureCellWithRedditPost(_ post: RedditPost) {
        
        let defaultImage = UIImage(named: "alien.png")
        
        if !post.thumbnailURL.isEmpty {
            profileImage.sd_setImage(with: URL(string: post.thumbnailURL), placeholderImage: defaultImage)
        } else {
            profileImage.image = defaultImage
        }
        
        // Add border
        profileImage.layer.borderColor = UIColor.themeColor().cgColor
        profileImage.layer.borderWidth = 2.0
        
        usernameLabel.text = post.author
        usernameLabel.textColor = UIColor.themeColor()
        usernameLabel.font = UIFont(name: "bebasneue", size: 15)
        
        titleLabel.text = post.title
        commentsLabel.text = String(format: "%d Comments", post.numberOfComments)
        upsLabel.text = String(format: "%d Ups", post.upPosts)
        downsLabel.text = String(format: "%d Downs", post.downPosts)
    }
}
