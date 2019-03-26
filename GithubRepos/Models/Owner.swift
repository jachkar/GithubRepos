//
//  Owner.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import Foundation


struct Owner: JSONCompatible {
    var organizations_url: String
    var repos_url: String
    var html_url: String
    var site_admin: Bool
    var gravatar_id: String
    var starred_url: String
    var avatar_url: String
    var type: String
    var gists_url: String
    var login: String
    var followers_url: String
    var id: Int
    var subscriptions_url: String
    var following_url: String
    var received_events_url: String
    var node_id: String
    var url: String
    var events_url: String

    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        organizations_url = json["organizations_url"] as? String ?? ""
        repos_url = json["repos_url"] as? String ?? ""
        html_url = json["html_url"] as? String ?? ""
        site_admin = json["site_admin"] as? Bool ?? false
        gravatar_id = json["gravatar_id"] as? String ?? ""
        starred_url = json["starred_url"] as? String ?? ""
        avatar_url = json["avatar_url"] as? String ?? ""
        type = json["type"] as? String ?? ""
        gists_url = json["gists_url"] as? String ?? ""
        login = json["login"] as? String ?? ""
        followers_url = json["followers_url"] as? String ?? ""
        id = json["id"] as? Int ?? 0
        subscriptions_url = json["subscriptions_url"] as? String ?? ""
        following_url = json["following_url"] as? String ?? ""
        received_events_url = json["received_events_url"] as? String ?? ""
        node_id = json["node_id"] as? String ?? ""
        url = json["url"] as? String ?? ""
        events_url = json["events_url"] as? String ?? ""
    }

    init() {
        self.init(json: [:])!
    }

    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }

    init(organizations_url: String, repos_url: String, html_url: String, site_admin: Bool, gravatar_id: String, starred_url: String, avatar_url: String, type: String, gists_url: String, login: String, followers_url: String, id: Int, subscriptions_url: String, following_url: String, received_events_url: String, node_id: String, url: String, events_url: String) {
        self.organizations_url = organizations_url
        self.repos_url = repos_url
        self.html_url = html_url
        self.site_admin = site_admin
        self.gravatar_id = gravatar_id
        self.starred_url = starred_url
        self.avatar_url = avatar_url
        self.type = type
        self.gists_url = gists_url
        self.login = login
        self.followers_url = followers_url
        self.id = id
        self.subscriptions_url = subscriptions_url
        self.following_url = following_url
        self.received_events_url = received_events_url
        self.node_id = node_id
        self.url = url
        self.events_url = events_url
    }

    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["organizations_url"] = organizations_url
        dict["repos_url"] = repos_url
        dict["html_url"] = html_url
        dict["site_admin"] = site_admin
        dict["gravatar_id"] = gravatar_id
        dict["starred_url"] = starred_url
        dict["avatar_url"] = avatar_url
        dict["type"] = type
        dict["gists_url"] = gists_url
        dict["login"] = login
        dict["followers_url"] = followers_url
        dict["id"] = id
        dict["subscriptions_url"] = subscriptions_url
        dict["following_url"] = following_url
        dict["received_events_url"] = received_events_url
        dict["node_id"] = node_id
        dict["url"] = url
        dict["events_url"] = events_url
        return dict
    }
}
