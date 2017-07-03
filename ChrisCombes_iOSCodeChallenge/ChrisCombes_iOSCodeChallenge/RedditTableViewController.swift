//
//  RedditTableViewController.swift
//  ChrisCombes_iOSCodeChallenge
//
//  Created by Christopher Combes on 7/3/17.
//  Copyright © 2017 Christopher Combes. All rights reserved.
//

import UIKit
import SwiftyJSON

class RedditTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var queryResult:RedditQuery?
    
    static func redditTableViewController() ->RedditTableViewController {
        let controller = RedditTableViewController(nibName: "RedditTableView", bundle: nil)
        return controller
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = String(format: "%d", indexPath.row)
        return cell
    }
    
    // MARK: Helpers
    func runSearchWithText(_ text: String) {
        
        // Stop further queries until current result completes
        searchBar.isUserInteractionEnabled = false
        
        RedditAPIManager().postsForCategory(text) { (json) in
            if json != JSON.null {
                if let result = RedditQuery(json: json) {
                    self.queryResult = result
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
