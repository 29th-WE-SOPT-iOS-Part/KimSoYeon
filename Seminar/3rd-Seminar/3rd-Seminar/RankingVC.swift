//
//  RankingVC.swift
//  3rd-Seminar
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

class RankingVC: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var rankTableView: UITableView!
    @IBOutlet weak var rankCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var appContentList: [AppContentDataModel] = []
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rankTableView.delegate = self
        rankTableView.dataSource = self
        
        let nib = UINib(nibName: RankingTVC.identifier, bundle: nil)
        rankTableView.register(nib, forCellReuseIdentifier: RankingTVC.identifier)
        
        rankTableView.separatorStyle = .none
        
        rankCollectionView.delegate = self
        rankCollectionView.dataSource = self
        
        initAppContentList()
    }
    
    // MARK: - Custom Methods
    
    private func initAppContentList() {
        appContentList.append(contentsOf: [
            AppContentDataModel(appName: "질병관리청",description: "전자예방접종증명서",appIconName: "coovIcon"),
            AppContentDataModel(appName: "카카오톡", description: "소셜 네트워킹", appIconName: "kakaoIcon"),
            AppContentDataModel(appName: "YouTube", description: "동영상과 음악", appIconName: "youtubeIcon"),
            AppContentDataModel(appName: "네이버", description: "검색과 콘텐츠, 쇼핑, 내도구", appIconName: "naverIcon"),
            AppContentDataModel(appName: "Instagram", description: "사진 및 비디오", appIconName: "instagramIcon"),
            AppContentDataModel(appName: "쿠팡", description: "스마트한 쇼핑", appIconName: "coupangIcon"),
            AppContentDataModel(appName: "배달의 민족", description: "대한민국 1등 배달앱", appIconName: "baeminIcon"),
            AppContentDataModel(appName: "당근마켓", description: "중고거래", appIconName: "karrotIcon"),
            AppContentDataModel(appName: "Netflix", description: "지금 바로 시청하세요", appIconName: "netflixIcon"),
            AppContentDataModel(appName: "무신사", description: "브랜드 패션 쇼핑", appIconName: "musinsaIcon")
        ])
    }
    
}

// MARK: - TableView Delegate

extension RankingVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

// MARK: - TableView DataSource

extension RankingVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RankingTVC.identifier) as? RankingTVC else { return UITableViewCell() }
        
        cell.setData(rank: indexPath.row + 1, appData: appContentList[indexPath.row])
        return cell
    }
}

// MARK: - CollectionView Delegate

extension RankingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - CollectionView DataSource

extension RankingVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCVC.identifier, for: indexPath) as? RankingCVC else { return UICollectionViewCell() }
        cell.setData(appName: appContentList[indexPath.row].appName, appImage: appContentList[indexPath.row].setImage())
        return cell
    }
}
