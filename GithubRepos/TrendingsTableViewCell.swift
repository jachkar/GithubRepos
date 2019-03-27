//
//  TrendingsTableViewCell.swift
//  GithubRepos
//
//  Created by Noel Achkar on 3/27/19.
//  Copyright © 2019 Noel Achkar. All rights reserved.
//

import UIKit
import SDWebImage

class TrendingsTableViewCell: UITableViewCell {

    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescLbl: UILabel!
    @IBOutlet weak var ownerNameLbl: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillCell(repoInfo : Item) {
        self.repoNameLbl.text = repoInfo.name
        self.repoDescLbl.text = repoInfo.description
        self.ownerNameLbl.text = repoInfo.owner.login
        self.userImage!.sd_setImage(with: NSURL.init(string: repoInfo.owner.avatar_url) as URL?, placeholderImage: nil)
    }
}
