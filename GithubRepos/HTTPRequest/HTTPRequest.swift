 //
 //  HTTPRequest.swift
 //  GithubRepos
 //
 //  Created by Noel Achkar on 3/26/19.
 //  Copyright © 2019 Noel Achkar. All rights reserved.
 //

import UIKit
import Alamofire

class HTTPRequest: NSObject
{
    override init ()
    {
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
    }
    
    func setHeaders(request : URLRequest) -> URLRequest
    {
        var urlRequest = request
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")

        return urlRequest
    }
    
    func GET(requestUrl : String , parameters : Parameters, success: @escaping (_ response:Any) -> Void, failure: @escaping () -> Void)
    {
        let url = URL(string: requestUrl)!
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString)).responseJSON { response in
            
            switch response.result
            {
            case .success:
                let resultString = String(data: response.data!, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!
                
                if let dictionary = resultString.convertToDictionary()
                {
                    success(dictionary as Any)
                }
                else
                {
                    failure()
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                failure()
                break
            }
        }
    }
}
