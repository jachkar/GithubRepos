//
//  JSONCompatible.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import Foundation

protocol JSONCompatible {
    init?(json: [String: Any]?)
    init()
    init?(data: Data?)
    func jsonDictionary(useOriginalJsonKey: Bool) -> [String: Any]
}



