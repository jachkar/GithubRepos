//
//  TrendingViewModel.swift
//  GithubRepos
//
//  Created by Noel Achkar on 7/21/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import Foundation

class TrendingViewModel {
    
    var items: [TrendingTableViewCellViewModel] = [] {
        didSet {
            self.didFinishFetch?()
        }
    }

    init(requester: Requester) {
        self.requester = requester
    }
    
    private var requester: Requester?

    var itemCount: Int {
        return self.items.count
    }
    
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    var error: String? {
        didSet { self.showAlertClosure?() }
    }
    
    func fetchItems(isLoadingMore: Bool, page: Int) {
        self.requester?.fetchData(isLoadingMore: isLoadingMore, page: page, complete: { (success, result, error, isLoadMore) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.error = nil
            self.isLoading = false
            
            if isLoadMore {
                self.processLoadMoreData(trendingItems: result!)
            } else {
                self.processFetchedData(trendingItems: result!)
            }
        })
    }
    
    func createCellViewModel( item: Item ) -> TrendingTableViewCellViewModel {
        return TrendingTableViewCellViewModel(titleText: item.name, descText: item.description, imageUrl: item.owner.avatar_url, starCountText: item.stargazers_count.roundCount, ownerText: item.owner.login)
    }
    
    private func processFetchedData( trendingItems: GithubReposResponse ) {
        var vms = [TrendingTableViewCellViewModel]()
        for item in trendingItems.items {
            vms.append(createCellViewModel(item: item))
        }
        self.items = vms
    }
    
    private func processLoadMoreData( trendingItems: GithubReposResponse ) {
        var vms = [TrendingTableViewCellViewModel]()
        for item in trendingItems.items {
            vms.append(createCellViewModel(item: item))
        }
        
        self.items.append(contentsOf: vms)
    }
    
    var updateLoadingStatus: (() -> ())?
    var showAlertClosure: (() -> ())?
    var didFinishFetch: (() -> ())?
}

struct TrendingTableViewCellViewModel {
    let titleText: String
    let descText: String
    let imageUrl: String
    let starCountText: String
    let ownerText: String
}
