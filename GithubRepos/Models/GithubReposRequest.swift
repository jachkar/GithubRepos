//
//  GithubReposRequest.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import Foundation

struct GithubReposRequest: JSONCompatible {
    var q: String
    var order: String
    var sort: String
    var page: String

    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        q = json["q"] as? String ?? ""
        order = json["order"] as? String ?? ""
        sort = json["sort"] as? String ?? ""
        page = json["page"] as? String ?? ""
    }

    init() {
        self.init(json: [:])!
    }

    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }

    init(q: String, order: String, sort: String, page: String) {
        self.q = q
        self.order = order
        self.sort = sort
        self.page = page
    }

    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["q"] = q
        dict["order"] = order
        dict["sort"] = sort
        dict["page"] = page
        return dict
    }
}
