//
//  VideoTVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

protocol VideoCellDelegate {
    func didTapThumnailImage(index: Int)
}

class VideoTVC: UITableViewCell {
    static let identifier = "VideoTVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var thumnailImageView: UIImageView!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var moreButton: UIButton!
    
    // MARK: - Properties
    
    var videoCellDelegate: VideoCellDelegate?
    var index = 0
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        setGesture()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension VideoTVC {
    private func initUI() {
        thumnailImageView.contentMode = .scaleAspectFill
        
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 15, weight: .regular)
        
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = .darkGray
        descriptionLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        moreButton.setTitle("", for: .normal)
        moreButton.setImage(UIImage(named: "moreMenuIcon"), for: .normal)
    }
    
    func setData(index: Int, thumnailImage: String, profileImage: String, title: String, channelName: String, views: Int, date: Int) {
        self.index = index
        
        thumnailImageView.image = UIImage(named: thumnailImage)
        profileImageView.image = UIImage(named: profileImage)
        
        titleLabel.text = title
        descriptionLabel.text = "\(channelName) \(views)회 \(date)주 전"
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedImageView(gestureRecognizer:)))
        thumnailImageView.isUserInteractionEnabled = true
        thumnailImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func tappedImageView(gestureRecognizer: UIGestureRecognizer) {
        self.videoCellDelegate?.didTapThumnailImage(index: index)
    }
}
