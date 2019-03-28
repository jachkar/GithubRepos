//
//  SettingsViewController.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/26/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import UIKit
import McPicker

class SettingsViewController: UIViewController {

    @IBOutlet weak var reposPerPageBtn: UIButton!
    @IBOutlet weak var languagesBtn: UIButton!
    @IBOutlet weak var daysBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBtn()
    }
    
    func setupBtn() {
        let days : String =  KEYS.daysKey.getUserDefault()
        let repos : String = KEYS.reposKey.getUserDefault()
        let languages : String = KEYS.languagesKey.getUserDefault()
        
        reposPerPageBtn.setTitle(repos, for: .normal)
        languagesBtn.setTitle(languages, for: .normal)
        daysBtn.setTitle(days, for: .normal)
    }
    
    @IBAction func reposPerPageFnc(_ sender: Any) {
        let button = sender as! UIButton
        showPicker(forButton: button, withData: repoPerPageData)
    }
    
    @IBAction func languagesFnc(_ sender: Any) {
        let button = sender as! UIButton
        showPicker(forButton: button, withData: languagesData)
    }
    
    @IBAction func daysFnc(_ sender: Any) {
        let button = sender as! UIButton
        showPicker(forButton: button, withData: daysData)
    }
    
    func showPicker(forButton : UIButton, withData : Array<String>) {
        McPicker.show(data: [withData]) {  [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                forButton.setTitle(name, for: .normal)
            }
        }
    }
    
    @IBAction func applyFnc(_ sender: Any) {
        
        //Save new params in order to get new data (Could be saved in CoreData)
        UserDefaults.standard.set(daysBtn.titleLabel?.text, forKey: KEYS.daysKey)
        UserDefaults.standard.set(reposPerPageBtn.titleLabel?.text, forKey: KEYS.reposKey)
        UserDefaults.standard.set(languagesBtn.titleLabel?.text, forKey: KEYS.languagesKey)
    
        UserDefaults.standard.synchronize()
        
        let trendingNav = self.tabBarController?.viewControllers![0] as! UINavigationController
        
        if let trendingVC : TrendingViewController = trendingNav.visibleViewController as? TrendingViewController
        {
            if trendingVC.isKind(of: TrendingViewController.self)
            {
                trendingVC.getData(isLoadingMore: false)
                self.tabBarController?.selectedIndex = 0
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
