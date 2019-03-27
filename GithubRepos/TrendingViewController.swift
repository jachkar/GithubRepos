//
//  TrendingViewController.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import UIKit
import SVProgressHUD

class TrendingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        getData()
    }
    
    func getData()
    {
        SVProgressHUD.show()
        
        let urlString = "https://api.github.com/search/repositories"
        
        var request = GithubReposRequest()
        request.q = "created:>2017-10-22"
        request.sort = "start"
        request.order = "desc"
        request.page = "1"

        let httpRequest = HTTPRequest.init()
        httpRequest.GET(requestUrl: urlString, parameters: request.jsonDictionary(useOriginalJsonKey: true), success:{(response:Any)  in
            if response is NSDictionary
            {
                SVProgressHUD.dismiss()

                print("Github Repos "+"\(response)")
                
//                loader.hide()
//
                let responseModel = GithubReposResponse.init(json: response as? Dictionary)

                if responseModel != nil
                {
//                    if regResponse?.result == true
//                    {
//                        Utilities.showMessage(message:"Thank you for your feedback !")
//
//                        self.feedbackTxt.text = ""
//                        self.phoneNumberTxt.text = ""
//                    }
//                    else
//                    {
//                        Utilities.showMessage(message: Constants.Messages.ErrorMessage)
//                    }
                }
//                else
//                {
//                    Utilities.showMessage(message: Constants.Messages.ErrorMessage)
//                }
            }
            else
            {
//                Utilities.showMessage(message: Constants.Messages.ErrorMessage)
            }
        }, failure: {() in
//            loader.hide()
//            Utilities.showMessage(message: Constants.Messages.ErrorMessage)
        } )
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
