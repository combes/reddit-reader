//
//  RedditTableViewController.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/3/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import UIKit
import SwiftyJSON

let defaultSearchCategory = "funny"

class RedditTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    private var queryResult:RedditQuery?
    
    static func redditTableViewController() ->RedditTableViewController {
        let controller = RedditTableViewController(nibName: "RedditTableView", bundle: nil)
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "RedditPostTableViewCell", bundle: nil), forCellReuseIdentifier: RedditPostTableViewCell.identifier)

        // Handle table row height variation
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension

        // Begin with default search category
        searchBar.text = defaultSearchCategory
        runSearchWithText(defaultSearchCategory)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        
        if queryResult != nil {
            count = (queryResult?.redditPosts.count)!
        }
        
        return count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RedditPostTableViewCell.identifier) as! RedditPostTableViewCell
        
        if let post = queryResult?.redditPosts[indexPath.row] {
            cell.configureCellWithRedditPost(post)
        }
        
        return cell
    }
    
    // MARK: Helpers
    func runSearchWithText(_ text: String) {
        
        // Stop further queries until current result completes
        searchBar.isUserInteractionEnabled = false
        searchBar.resignFirstResponder()
        
        RedditAPIManager().postsForCategory(text) { (json) in
            if json != JSON.null {
                if let result = RedditQuery(json: json) {
                    self.queryResult = result
                    DispatchQueue.main.sync {
                        self.tableView.reloadData()
                    }
                }
            }
            
            DispatchQueue.main.sync {
                // Allow search again
                self.searchBar.isUserInteractionEnabled = true
            }
        }
    }
    
    // MARK: Actions
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        if let searchText = searchBar.text {
            runSearchWithText(searchText)
        }
    }
    
    // MARK: UISearchBarDelegate
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let searchText = searchBar.text {
            runSearchWithText(searchText)
        }
    }
}
