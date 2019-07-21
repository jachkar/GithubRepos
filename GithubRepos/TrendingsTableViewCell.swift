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
    @IBOutlet weak var starCountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var trendingTableViewCellViewModel: TrendingTableViewCellViewModel? {
        didSet {
            self.repoNameLbl.text = trendingTableViewCellViewModel?.titleText
            self.repoDescLbl.text = trendingTableViewCellViewModel?.descText
            self.ownerNameLbl.text = trendingTableViewCellViewModel?.ownerText
            self.userImage!.sd_setImage(with: NSURL.init(string: trendingTableViewCellViewModel!.imageUrl) as URL?, placeholderImage: #imageLiteral(resourceName: "placeholder"))
            self.starCountLbl.text = trendingTableViewCellViewModel?.starCountText
        }
    }
}
