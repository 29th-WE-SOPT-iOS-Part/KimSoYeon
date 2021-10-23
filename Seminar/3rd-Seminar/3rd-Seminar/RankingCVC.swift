//
//  RankingCVC.swift
//  3rd-Seminar
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

class RankingCVC: UICollectionViewCell {
    static let identifier = "RankingCVC"
    
    @IBOutlet weak var appIconImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    
    func setData(appName: String, appImage: UIImage?) {
        appNameLabel.text = appName
        appIconImageView.image = appImage
    }
}
