//
//  Item.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import Foundation

struct Item: JSONCompatible {
    var pulls_url: String
    var subscribers_url: String
    var tags_url: String
    var open_issues: Int
    var has_projects: Bool
    var clone_url: String
    var size: Int
    var git_url: String
    var git_tags_url: String
    var id: Int
    var default_branch: String
    var issue_events_url: String
    var mirror_url: Any?
    var archived: Bool
    var downloads_url: String
    var comments_url: String
    var homepage: String
    var teams_url: String
    var url: String
    var has_pages: Bool
    var hooks_url: String
    var html_url: String
    var issues_url: String
    var full_name: String
    var fork: Bool
    var description: String
    var license: Any?
    var notifications_url: String
    var ssh_url: String
    var stargazers_count: Int
    var issue_comment_url: String
    var compare_url: String
    var languages_url: String
    var watchers: Int
    var milestones_url: String
    var branches_url: String
    var collaborators_url: String
    var has_issues: Bool
    var archive_url: String
    var forks: Int
    var created_at: String
    var assignees_url: String
    var open_issues_count: Int
    var labels_url: String
    var forks_count: Int
    var events_url: String
    var blobs_url: String
    var has_downloads: Bool
    var svn_url: String
    var forks_url: String
    var `private`: Bool
    var releases_url: String
    var language: Any?
    var pushed_at: String
    var contents_url: String
    var statuses_url: String
    var owner: Owner
    var git_refs_url: String
    var stargazers_url: String
    var name: String
    var contributors_url: String
    var score: Int
    var subscription_url: String
    var updated_at: String
    var trees_url: String
    var keys_url: String
    var has_wiki: Bool
    var git_commits_url: String
    var commits_url: String
    var watchers_count: Int
    var deployments_url: String
    var merges_url: String
    var node_id: String

    init?(json: [String: Any]?) {
        guard let json = json else {return nil}
        pulls_url = json["pulls_url"] as? String ?? ""
        subscribers_url = json["subscribers_url"] as? String ?? ""
        tags_url = json["tags_url"] as? String ?? ""
        open_issues = json["open_issues"] as? Int ?? 0
        has_projects = json["has_projects"] as? Bool ?? false
        clone_url = json["clone_url"] as? String ?? ""
        size = json["size"] as? Int ?? 0
        git_url = json["git_url"] as? String ?? ""
        git_tags_url = json["git_tags_url"] as? String ?? ""
        id = json["id"] as? Int ?? 0
        default_branch = json["default_branch"] as? String ?? ""
        issue_events_url = json["issue_events_url"] as? String ?? ""
        mirror_url = json["mirror_url"]
        archived = json["archived"] as? Bool ?? false
        downloads_url = json["downloads_url"] as? String ?? ""
        comments_url = json["comments_url"] as? String ?? ""
        homepage = json["homepage"] as? String ?? ""
        teams_url = json["teams_url"] as? String ?? ""
        url = json["url"] as? String ?? ""
        has_pages = json["has_pages"] as? Bool ?? false
        hooks_url = json["hooks_url"] as? String ?? ""
        html_url = json["html_url"] as? String ?? ""
        issues_url = json["issues_url"] as? String ?? ""
        full_name = json["full_name"] as? String ?? ""
        fork = json["fork"] as? Bool ?? false
        description = json["description"] as? String ?? ""
        license = json["license"]
        notifications_url = json["notifications_url"] as? String ?? ""
        ssh_url = json["ssh_url"] as? String ?? ""
        stargazers_count = json["stargazers_count"] as? Int ?? 0
        issue_comment_url = json["issue_comment_url"] as? String ?? ""
        compare_url = json["compare_url"] as? String ?? ""
        languages_url = json["languages_url"] as? String ?? ""
        watchers = json["watchers"] as? Int ?? 0
        milestones_url = json["milestones_url"] as? String ?? ""
        branches_url = json["branches_url"] as? String ?? ""
        collaborators_url = json["collaborators_url"] as? String ?? ""
        has_issues = json["has_issues"] as? Bool ?? false
        archive_url = json["archive_url"] as? String ?? ""
        forks = json["forks"] as? Int ?? 0
        created_at = json["created_at"] as? String ?? ""
        assignees_url = json["assignees_url"] as? String ?? ""
        open_issues_count = json["open_issues_count"] as? Int ?? 0
        labels_url = json["labels_url"] as? String ?? ""
        forks_count = json["forks_count"] as? Int ?? 0
        events_url = json["events_url"] as? String ?? ""
        blobs_url = json["blobs_url"] as? String ?? ""
        has_downloads = json["has_downloads"] as? Bool ?? false
        svn_url = json["svn_url"] as? String ?? ""
        forks_url = json["forks_url"] as? String ?? ""
        `private` = json["private"] as? Bool ?? false
        releases_url = json["releases_url"] as? String ?? ""
        language = json["language"]
        pushed_at = json["pushed_at"] as? String ?? ""
        contents_url = json["contents_url"] as? String ?? ""
        statuses_url = json["statuses_url"] as? String ?? ""
        owner = Owner(json: json["owner"] as? [String: Any]) ?? Owner()
        git_refs_url = json["git_refs_url"] as? String ?? ""
        stargazers_url = json["stargazers_url"] as? String ?? ""
        name = json["name"] as? String ?? ""
        contributors_url = json["contributors_url"] as? String ?? ""
        score = json["score"] as? Int ?? 0
        subscription_url = json["subscription_url"] as? String ?? ""
        updated_at = json["updated_at"] as? String ?? ""
        trees_url = json["trees_url"] as? String ?? ""
        keys_url = json["keys_url"] as? String ?? ""
        has_wiki = json["has_wiki"] as? Bool ?? false
        git_commits_url = json["git_commits_url"] as? String ?? ""
        commits_url = json["commits_url"] as? String ?? ""
        watchers_count = json["watchers_count"] as? Int ?? 0
        deployments_url = json["deployments_url"] as? String ?? ""
        merges_url = json["merges_url"] as? String ?? ""
        node_id = json["node_id"] as? String ?? ""
    }

    init() {
        self.init(json: [:])!
    }

    init?(data: Data?) {
        guard let data = data else {return nil}
        guard let json = (try? JSONSerialization.jsonObject(with: data, options: [])) as? [String: Any] else {return nil}
        self.init(json: json)
    }

    init(pulls_url: String, subscribers_url: String, tags_url: String, open_issues: Int, has_projects: Bool, clone_url: String, size: Int, git_url: String, git_tags_url: String, id: Int, default_branch: String, issue_events_url: String, mirror_url: Any?, archived: Bool, downloads_url: String, comments_url: String, homepage: String, teams_url: String, url: String, has_pages: Bool, hooks_url: String, html_url: String, issues_url: String, full_name: String, fork: Bool, description: String, license: Any?, notifications_url: String, ssh_url: String, stargazers_count: Int, issue_comment_url: String, compare_url: String, languages_url: String, watchers: Int, milestones_url: String, branches_url: String, collaborators_url: String, has_issues: Bool, archive_url: String, forks: Int, created_at: String, assignees_url: String, open_issues_count: Int, labels_url: String, forks_count: Int, events_url: String, blobs_url: String, has_downloads: Bool, svn_url: String, forks_url: String, `private`: Bool, releases_url: String, language: Any?, pushed_at: String, contents_url: String, statuses_url: String, owner: Owner, git_refs_url: String, stargazers_url: String, name: String, contributors_url: String, score: Int, subscription_url: String, updated_at: String, trees_url: String, keys_url: String, has_wiki: Bool, git_commits_url: String, commits_url: String, watchers_count: Int, deployments_url: String, merges_url: String, node_id: String) {
        self.pulls_url = pulls_url
        self.subscribers_url = subscribers_url
        self.tags_url = tags_url
        self.open_issues = open_issues
        self.has_projects = has_projects
        self.clone_url = clone_url
        self.size = size
        self.git_url = git_url
        self.git_tags_url = git_tags_url
        self.id = id
        self.default_branch = default_branch
        self.issue_events_url = issue_events_url
        self.mirror_url = mirror_url
        self.archived = archived
        self.downloads_url = downloads_url
        self.comments_url = comments_url
        self.homepage = homepage
        self.teams_url = teams_url
        self.url = url
        self.has_pages = has_pages
        self.hooks_url = hooks_url
        self.html_url = html_url
        self.issues_url = issues_url
        self.full_name = full_name
        self.fork = fork
        self.description = description
        self.license = license
        self.notifications_url = notifications_url
        self.ssh_url = ssh_url
        self.stargazers_count = stargazers_count
        self.issue_comment_url = issue_comment_url
        self.compare_url = compare_url
        self.languages_url = languages_url
        self.watchers = watchers
        self.milestones_url = milestones_url
        self.branches_url = branches_url
        self.collaborators_url = collaborators_url
        self.has_issues = has_issues
        self.archive_url = archive_url
        self.forks = forks
        self.created_at = created_at
        self.assignees_url = assignees_url
        self.open_issues_count = open_issues_count
        self.labels_url = labels_url
        self.forks_count = forks_count
        self.events_url = events_url
        self.blobs_url = blobs_url
        self.has_downloads = has_downloads
        self.svn_url = svn_url
        self.forks_url = forks_url
        self.`private` = `private`
        self.releases_url = releases_url
        self.language = language
        self.pushed_at = pushed_at
        self.contents_url = contents_url
        self.statuses_url = statuses_url
        self.owner = owner
        self.git_refs_url = git_refs_url
        self.stargazers_url = stargazers_url
        self.name = name
        self.contributors_url = contributors_url
        self.score = score
        self.subscription_url = subscription_url
        self.updated_at = updated_at
        self.trees_url = trees_url
        self.keys_url = keys_url
        self.has_wiki = has_wiki
        self.git_commits_url = git_commits_url
        self.commits_url = commits_url
        self.watchers_count = watchers_count
        self.deployments_url = deployments_url
        self.merges_url = merges_url
        self.node_id = node_id
    }

    /// This function generate a json dictionary from the model.
    ///
    /// - Parameter useOriginalJsonKey: This parameter take effect only when you have modified a property's name making it different to the original json key. If true, the original json key will be used when generate json dictionary, otherwise, the modified property name will be used as key in the dictionary.
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any] {
        var dict: [String: Any] = [:]
        dict["pulls_url"] = pulls_url
        dict["subscribers_url"] = subscribers_url
        dict["tags_url"] = tags_url
        dict["open_issues"] = open_issues
        dict["has_projects"] = has_projects
        dict["clone_url"] = clone_url
        dict["size"] = size
        dict["git_url"] = git_url
        dict["git_tags_url"] = git_tags_url
        dict["id"] = id
        dict["default_branch"] = default_branch
        dict["issue_events_url"] = issue_events_url
        dict["mirror_url"] = mirror_url
        dict["archived"] = archived
        dict["downloads_url"] = downloads_url
        dict["comments_url"] = comments_url
        dict["homepage"] = homepage
        dict["teams_url"] = teams_url
        dict["url"] = url
        dict["has_pages"] = has_pages
        dict["hooks_url"] = hooks_url
        dict["html_url"] = html_url
        dict["issues_url"] = issues_url
        dict["full_name"] = full_name
        dict["fork"] = fork
        dict["description"] = description
        dict["license"] = license
        dict["notifications_url"] = notifications_url
        dict["ssh_url"] = ssh_url
        dict["stargazers_count"] = stargazers_count
        dict["issue_comment_url"] = issue_comment_url
        dict["compare_url"] = compare_url
        dict["languages_url"] = languages_url
        dict["watchers"] = watchers
        dict["milestones_url"] = milestones_url
        dict["branches_url"] = branches_url
        dict["collaborators_url"] = collaborators_url
        dict["has_issues"] = has_issues
        dict["archive_url"] = archive_url
        dict["forks"] = forks
        dict["created_at"] = created_at
        dict["assignees_url"] = assignees_url
        dict["open_issues_count"] = open_issues_count
        dict["labels_url"] = labels_url
        dict["forks_count"] = forks_count
        dict["events_url"] = events_url
        dict["blobs_url"] = blobs_url
        dict["has_downloads"] = has_downloads
        dict["svn_url"] = svn_url
        dict["forks_url"] = forks_url
        dict[(useOriginalJsonKey ? "private" : "`private`")] = `private`
        dict["releases_url"] = releases_url
        dict["language"] = language
        dict["pushed_at"] = pushed_at
        dict["contents_url"] = contents_url
        dict["statuses_url"] = statuses_url
        dict["owner"] = owner.jsonDictionary(useOriginalJsonKey: useOriginalJsonKey)
        dict["git_refs_url"] = git_refs_url
        dict["stargazers_url"] = stargazers_url
        dict["name"] = name
        dict["contributors_url"] = contributors_url
        dict["score"] = score
        dict["subscription_url"] = subscription_url
        dict["updated_at"] = updated_at
        dict["trees_url"] = trees_url
        dict["keys_url"] = keys_url
        dict["has_wiki"] = has_wiki
        dict["git_commits_url"] = git_commits_url
        dict["commits_url"] = commits_url
        dict["watchers_count"] = watchers_count
        dict["deployments_url"] = deployments_url
        dict["merges_url"] = merges_url
        dict["node_id"] = node_id
        return dict
    }
}
