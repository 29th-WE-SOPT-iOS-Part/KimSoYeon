//
//  RankingTVC.swift
//  3rd-Seminar
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

class RankingTVC: UITableViewCell {
    static let identifier = "RankingTVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var openButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension RankingTVC {
    func setData(rank: Int, appData: AppContentDataModel) {
        rankLabel.text = "\(rank)"
        
        appIconImageView.image = appData.setImage()
        titleLabel.text = appData.appName
        subTitleLabel.text = appData.description
    }
}
