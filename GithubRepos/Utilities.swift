//
//  Utilities.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import UIKit

struct URLS
{
    static let AppServerAddress = "https://api.github.com/search/repositories"
}

extension String
{
    func convertToDictionary() -> [String: Any]?
    {
        if let data = self.data(using: .utf8)
        {
            do
            {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
