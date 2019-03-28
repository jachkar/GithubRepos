//
//  Utilities.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import UIKit

let AppServerAddress = "https://api.github.com/search/repositories"

var daysData : Array<String> = ["10","20","30","40","50","60"]
var repoPerPageData : Array<String> = ["30","40","50","60","70","80","90","100"]
var languagesData : Array<String> = ["All","Swift","Objective-C","JavaScript","Java","Python","PHP","C#","C++","HTML","C","CSS","TypeScript","Shell"]

struct KEYS
{
    static let daysKey = "daysKey"
    static let reposKey = "reposKey"
    static let languagesKey = "languagesKey"
}

extension Date {
    func formatDate() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
}

extension Int {
    var roundCount: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return "\(round(million*10)/10)M"
        }
        else if thousand >= 1.0 {
            return "\(round(thousand*10)/10)K"
        }
        else {
            return "\(Int(number))"
        }
    }
}

extension String
{
    func convertToDictionary() -> [String: Any]? {
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
    
    func getUserDefault() -> String
    {
        let value = UserDefaults.standard.object(forKey: self) as? String ?? ""
        return value
    }
}
