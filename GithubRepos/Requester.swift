//
//  Requester.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/28/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import UIKit
import SVProgressHUD
import PullToRefreshKit

extension TrendingViewController
{
    func getData(isLoadingMore : Bool) {
        if isLoadingMore == false {
            SVProgressHUD.show()
        }
        
        let days = KEYS.daysKey.getUserDefault()
        let repos = KEYS.reposKey.getUserDefault()
        let languages = KEYS.languagesKey.getUserDefault()
        
        let valueDays = Int(days)
        //Get date 'valueDays' days ago
        let fromDate = Calendar.current.date(byAdding: .day, value: -valueDays!, to: Date())
        let dateStr = fromDate?.formatDate()
        
        var request = GithubReposRequest()
        request.q = "created:>\(dateStr ?? "2017-11-22")"
        request.sort = "start"
        request.order = "desc"
        request.perpage = repos // In order to get X per page default returning 30
        
        if languages != "All" {
            request.q.append(contentsOf: "+language:\(languages.lowercased())")
        }
        
        if isLoadingMore == false {
            request.page =  "1"
            SVProgressHUD.show()
        } else {
            let page = self.responseItems!.count/Int(repos)! + 1
            request.page = String(page)
        }
        
        var urlString = "\(AppServerAddress)?q=\(request.q)&sort=stars&order=desc&page=\(request.page)&per_page=\(request.perpage)"
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let httpRequest = HTTPRequest.init()
        httpRequest.GET(requestUrl: urlString, parameters: [:], success:{(response:Any)  in
            if response is NSDictionary
            {
                SVProgressHUD.dismiss()
                
                print("Github Repos "+"\(response)")
                
                let responseModel = GithubReposResponse.init(json: response as? Dictionary)
                if responseModel != nil
                {
                    if isLoadingMore == false
                    {
                        self.responseItems = responseModel?.items
                        
                        self.tableView.configRefreshFooter(container:self) { [weak self] in
                            self!.getData(isLoadingMore: true)
                        };
                    }
                    else
                    {
                        self.responseItems?.append(contentsOf: responseModel!.items)
                        self.tableView.switchRefreshFooter(to: .normal)
                    }
                    
                    if (responseModel?.items.count)! < Int(repos)!
                    {
                        self.tableView.switchRefreshFooter(to: .removed)
                    }
                    
                    self.tableView.reloadData()
                }
            }
            else
            {
                SVProgressHUD.dismiss()
                self.tableView.switchRefreshFooter(to: .normal)
            }
        }, failure: {() in
            SVProgressHUD.dismiss()
            self.tableView.switchRefreshFooter(to: .normal)
        } )
    }
}

