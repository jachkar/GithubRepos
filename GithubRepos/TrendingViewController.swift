//
//  TrendingViewController.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import UIKit
import SVProgressHUD

class TrendingViewController: UITableViewController {

    private var viewModel = TrendingViewModel(requester: Requester())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.tableView.register(UINib(nibName: "TrendingsTableViewCell", bundle: nil), forCellReuseIdentifier: "TrendingsCell")
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = UITableView.automaticDimension
        
        startFetch()
    }
    
    func startFetch() {
        attemptFetch(isLoadingMore: false, page: 0)
    }
    
    private func attemptFetch(isLoadingMore: Bool, page: Int) {
        viewModel.fetchItems(isLoadingMore: isLoadingMore, page: page)
        
        viewModel.updateLoadingStatus = {
            let _ = self.viewModel.isLoading ? SVProgressHUD.show() : SVProgressHUD.dismiss()
        }
        
        viewModel.showAlertClosure = {
            if let error = self.viewModel.error {
                self.tableView.switchRefreshFooter(to: .normal)
            }
        }

        viewModel.didFinishFetch = {
            self.tableView.reloadData()
            
            self.tableView.configRefreshFooter(container:self) { [weak self] in
                self!.attemptFetch(isLoadingMore: true, page: self!.viewModel.items.count/Int(KEYS.reposKey.getUserDefault())! + 1)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.itemCount
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingsCell", for: indexPath) as! TrendingsTableViewCell
        cell.selectionStyle = .none
        cell.trendingTableViewCellViewModel = viewModel.items[indexPath.row]
        return cell
    }
}
