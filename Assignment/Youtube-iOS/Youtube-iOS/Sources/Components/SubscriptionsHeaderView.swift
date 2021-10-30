//
//  SubscriptionsHeaderView.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/28.
//

import UIKit

class SubscriptionsHeaderView: UIView {
    
    // MARK: - UI
    
    private var channelCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private var sortCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Properties
    
    private var channelList = [ChannelDataModel]()
    private var sortList = [String]()
    
    // MARK: - Initaliziers 
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setConstraints()
        
        setData()
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
    
    private func initUI() {
        self.backgroundColor = .systemBackground
    }
    
    private func setConstraints() {
        addSubviews([channelCollectionView, sortCollectionView])
        
        channelCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(104)
        }

        sortCollectionView.snp.makeConstraints { make in
            make.top.equalTo(channelCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    private func setData() {
        channelList.append(contentsOf: [
            ChannelDataModel(channelImage: "ggamju1", channelName: "배고파"),
            ChannelDataModel(channelImage: "ggamju2", channelName: "졸려"),
            ChannelDataModel(channelImage: "ggamju3", channelName: "아직도"),
            ChannelDataModel(channelImage: "ggamju4", channelName: "시험이"),
            ChannelDataModel(channelImage: "ggamju5", channelName: "안끝난"),
            ChannelDataModel(channelImage: "ggamju6", channelName: "사람이"),
            ChannelDataModel(channelImage: "ggamju7", channelName: "있다?"),
            ChannelDataModel(channelImage: "ggamju8", channelName: "바로 나")
        ])
        
        sortList.append(contentsOf: [
            "전체", "오늘", "이어서 시청하기", "시청하지 않음", "실시간", "게시물"
        ])
    }
    
    private func setCollectionView() {
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        channelCollectionView.register(ChannelCVC.self, forCellWithReuseIdentifier: ChannelCVC.identifier)
        
        sortCollectionView.delegate = self
        sortCollectionView.dataSource = self
        sortCollectionView.register(SortCVC.self, forCellWithReuseIdentifier: SortCVC.identifier)
    }
    
    private func setLabelWidth(index: Int) -> CGFloat {
        let label = UILabel()
        label.text = sortList[index]
        label.sizeToFit()
        return label.frame.width + 10 + 10
    }
}

// MARK: - UICollectionView Delegate

extension SubscriptionsHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == channelCollectionView {
            return CGSize(width: 72, height: 104)
        } else {
            return CGSize(width: setLabelWidth(index: indexPath.item), height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if  collectionView == sortCollectionView {
            return 9
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if  collectionView == sortCollectionView {
            return UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        }
        return UIEdgeInsets.zero
    }
}

// MARK: - UICollectionView DataSource

extension SubscriptionsHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == channelCollectionView {
            return channelList.count
        } else {
            return sortList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == channelCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCVC.identifier, for: indexPath) as? ChannelCVC else { return UICollectionViewCell() }
            cell.setData(channelImage: channelList[indexPath.row].channelImage, channelName: channelList[indexPath.row].channelName)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SortCVC.identifier, for: indexPath) as? SortCVC else { return UICollectionViewCell() }
            cell.setLabel(sort: sortList[indexPath.row])
            return cell
        }
    }
}
