//
//  ChannelCVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

class ChannelCVC: UICollectionViewCell {
    static let identifier = "ChannelCVC"
    
    // MARK: - UI
    
    private var channelImageView = UIImageView()
    private var channelLabel = UILabel()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        channelImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(14)
            make.leading.trailing.equalToSuperview().inset(7)
            make.bottom.equalToSuperview().inset(32)
        }
        
        channelLabel.snp.makeConstraints { make in
            make.top.equalTo(channelImageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }
}

extension ChannelCVC {
    func initUI() {
        contentView.addSubviews([channelImageView, channelLabel])
        
        channelImageView.contentMode = .scaleAspectFit
        
        channelLabel.textColor = .black
        channelLabel.font = .systemFont(ofSize: 12, weight: .regular)
        channelLabel.textAlignment = .center
    }
    
    func setData(channelImage: String, channelName: String) {
        channelImageView.image = UIImage(named: channelImage)
        channelLabel.text = channelName
    }
}
