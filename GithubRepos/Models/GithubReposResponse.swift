//
//  GithubReposResponse.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import Foundation

struct GithubReposResponse: JSONCompatible {
    var incomplete_results: Bool
    var total_count: Int
    var items: [Item]

    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        incomplete_results = json["incomplete_results"] as? Bool ?? false
        total_count = json["total_count"] as? Int ?? 0
        items = (json["items"] as? [[String: Any]] ?? []).compactMap{Item(json: $0)}
    }

    init() {
        self.init(json: [:])!
    }

    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }

    init(incomplete_results: Bool, total_count: Int, items: [Item]) {
        self.incomplete_results = incomplete_results
        self.total_count = total_count
        self.items = items
    }

    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["incomplete_results"] = incomplete_results
        dict["total_count"] = total_count
        dict["items"] = items.map{$0.jsonDictionary(useOriginalJsonKey: useOriginalJsonKey)}
        return dict
    }
}

