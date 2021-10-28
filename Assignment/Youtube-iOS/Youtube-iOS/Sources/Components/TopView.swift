//
//  TopView.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/28.
//

import UIKit
import SnapKit

class TopView: UIView {

    // MARK: - UI
    
    private var logoImageView = UIImageView()
    
    private var buttonStackView = UIStackView()
    private var windowSharingButton = UIButton()
    private var notificationButton = UIButton()
    private var searchButton = UIButton()
    private var profileButton = UIButton()
    
    // MARK: - Initaliziers
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        initUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    // MARK: - Custom Methods
    
    private func initUI() {
        backgroundColor = .white
        
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .scaleAspectFill
        
        buttonStackView.alignment = .fill
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 5
        buttonStackView.addArrangedSubview(windowSharingButton)
        buttonStackView.addArrangedSubview(notificationButton)
        buttonStackView.addArrangedSubview(searchButton)
        buttonStackView.addArrangedSubview(profileButton)
        
        windowSharingButton.setImage(UIImage(named: "windowSharingIcon"), for: .normal)
        notificationButton.setImage(UIImage(named: "notificationIcon"), for: .normal)
        searchButton.setImage(UIImage(named: "searchIcon"), for: .normal)
        profileButton.setImage(UIImage(named: "wesoptProfile"), for: .normal)
    }
    
    private func setConstraints() {
        addSubviews([logoImageView, buttonStackView])
        
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self.snp.centerY)
            make.leading.equalToSuperview().inset(16)
            make.width.equalTo(96)
            make.height.equalTo(20)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.width.equalTo(160)
        }
    }
}
