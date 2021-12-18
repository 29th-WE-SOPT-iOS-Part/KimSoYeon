//
//  DetailVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/12/04.
//

import UIKit
import SnapKit

class DetailVC: UIViewController {
    
    // MARK: - UI
    
    private var thunmnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "wesoptiOSPart")
        return imageView
    }()
    
    private var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .white
        button.titleLabel?.textColor = .white
        return button
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1주차 세미나 어쩌고 저쩌고 재밌다 아요 지대 멋지다 지대 짱"
        label.textColor = .black
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "조회수 100만회 | 3주 전"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private var moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "moreMenuIcon"), for: .normal)
        return button
    }()
    
    // MARK: - Properties
    
    var detailClosure: (() -> ())?
    
    var videoTitle = ""
    var videoDescription = ""
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setConstraints()
        setAction()
    }
}

extension DetailVC {
    private func initUI() {
        view.backgroundColor = .white
        
        titleLabel.text = videoTitle
        descriptionLabel.text = videoDescription
    }
    
    private func setConstraints() {
        view.addSubviews([thunmnailImageView, dismissButton, titleLabel, descriptionLabel, moreButton])
        
        thunmnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(212)
        }
        
        dismissButton.snp.makeConstraints {
            $0.top.equalTo(thunmnailImageView.snp.top).offset(12)
            $0.leading.equalToSuperview().inset(12)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(thunmnailImageView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(45)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(12)
        }
        
        moreButton.snp.makeConstraints {
            $0.top.equalTo(thunmnailImageView.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(12)
        }
    }
    
    private func setAction() {
        dismissButton.addAction(UIAction(handler: { _ in
            self.dismiss(animated: true, completion: nil)
        }), for: .touchUpInside)
    }
}
