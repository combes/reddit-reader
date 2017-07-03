//
//  RedditTableViewController.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/3/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import UIKit

class RedditTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    static func redditTableViewController() ->RedditTableViewController {
        let controller = RedditTableViewController(nibName: "RedditTableView", bundle: nil)
        return controller
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
