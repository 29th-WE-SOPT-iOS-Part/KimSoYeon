//
//  SubscribeVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/15.
//

import UIKit

class SubscriptionsVC: UIViewController {
    
    // MARK: - UI
    
    private var topView = UIView()
    
    private var logoImageView = UIImageView()
    private var buttonStackView = UIStackView()
    private var windowSharingButton = UIButton()
    private var notificationButton = UIButton()
    private var searchButton = UIButton()
    private var profileButton = UIButton()
    
    private var homeTableView = UITableView()
    private var homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()


    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        setConstraints()
        setTableView()
    }
}

extension SubscriptionsVC {
    func initUI() {
        view.backgroundColor = .white
        
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
    
    func setConstraints() {
        view.addSubviews([topView, homeCollectionView, homeTableView])
        topView.addSubviews([logoImageView, buttonStackView])
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        logoImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(96)
            make.height.equalTo(20)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
            make.width.equalTo(160)
        }
        
        homeCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(104)
        }
        
        homeTableView.snp.makeConstraints { make in
            make.top.equalTo(homeCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func setTableView() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
}

extension SubscriptionsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension SubscriptionsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
