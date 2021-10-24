//
//  SortCVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/25.
//

import UIKit

class SortCVC: UICollectionViewCell {
    static let identifier = "SortCVC"
    
    // MARK: - UI
    
    private var sortLabel = UILabel()
    
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        sortLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

extension SortCVC {
    func initUI() {
        contentView.addSubview(sortLabel)
        
        sortLabel.textColor = .black
        sortLabel.font = .systemFont(ofSize: 15, weight: .regular)
    }
    
    func setData(sort: String) {
        sortLabel.text = sort
    }
}
