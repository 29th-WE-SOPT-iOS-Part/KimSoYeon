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
    
    private var videoTableView = UITableView()
    
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
    
    private var videoList = [VideoDataModel]()
    private var channelList = [ChannelDataModel]()
    
    private var sortList = [String]()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setConstraints()
        
        setData()
        setTableView()
        setCollectionView()
    }
}

// MARK: - Custom Methods

extension SubscriptionsVC {
    private func initUI() {
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
    
    private func setConstraints() {
        view.addSubviews([topView, channelCollectionView, sortCollectionView, videoTableView])
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
        
        channelCollectionView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(104)
        }
        
        sortCollectionView.snp.makeConstraints { make in
            make.top.equalTo(channelCollectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(40)
        }
        
        videoTableView.snp.makeConstraints { make in
            make.top.equalTo(sortCollectionView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setData() {
        videoList.append(contentsOf: [
            VideoDataModel(thumbnailImage: "wesoptiOSPart", profileImage: "wesoptProfile", title: "1주차 세미나 어쩌고 저쩌고 재밌다 아요 지대 멋지다 지대 짱", channelName: "WE SOPT", views: 100, date: 3),
            VideoDataModel(thumbnailImage: "wesoptiOSPart", profileImage: "wesoptProfile", title: "2주차 세미나 어쩌고 저쩌고 재밌다 아요 지대 멋지다 지대 짱", channelName: "WE SOPT", views: 100, date: 3),
            VideoDataModel(thumbnailImage: "wesoptiOSPart", profileImage: "wesoptProfile", title: "3주차 세미나 어쩌고 저쩌고 재밌다 아요 지대 멋지다 지대 짱", channelName: "WE SOPT", views: 100, date: 3),
            VideoDataModel(thumbnailImage: "wesoptiOSPart", profileImage: "wesoptProfile", title: "4주차 세미나 어쩌고 저쩌고 재밌다 아요 지대 멋지다 지대 짱", channelName: "WE SOPT", views: 100, date: 3),
            VideoDataModel(thumbnailImage: "wesoptiOSPart", profileImage: "wesoptProfile", title: "5주차 세미나 어쩌고 저쩌고 재밌다 아요 지대 멋지다 지대 짱", channelName: "WE SOPT", views: 100, date: 3),
            VideoDataModel(thumbnailImage: "wesoptiOSPart", profileImage: "wesoptProfile", title: "6주차 세미나 어쩌고 저쩌고 재밌다 아요 지대 멋지다 지대 짱", channelName: "WE SOPT", views: 100, date: 3)
        ])
        
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
    
    private func setTableView() {
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        let videoNib = UINib(nibName: VideoTVC.identifier, bundle: nil)
        videoTableView.register(videoNib, forCellReuseIdentifier: VideoTVC.identifier)
        
        videoTableView.allowsSelection = false
    }
    
    private func setCollectionView() {
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        channelCollectionView.register(ChannelCVC.self, forCellWithReuseIdentifier: ChannelCVC.identifier)
        
        sortCollectionView.delegate = self
        sortCollectionView.dataSource = self
        sortCollectionView.register(SortCVC.self, forCellWithReuseIdentifier: SortCVC.identifier)
    }
}

// MARK: - UITableView Delegate

extension SubscriptionsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

// MARK: - UITableView DataSource

extension SubscriptionsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: VideoTVC.identifier) as? VideoTVC else { return UITableViewCell() }
        let data = videoList[indexPath.row]
        cell.setData(thumnailImage: data.thumbnailImage, profileImage: data.profileImage, title: data.title, channelName: data.channelName, views: data.views, date: data.date)
        return cell
    }
}

// MARK: - UICollectionView Delegate

extension SubscriptionsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == channelCollectionView {
            return CGSize(width: 72, height: 104)
        } else {
            // fix: text 길이에 맞게
            return CGSize(width: 10, height: 30)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == channelCollectionView {
            return 0
        } else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
}

extension SubscriptionsVC:  UICollectionViewDataSource {
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
            cell.setData(sort: sortList[indexPath.row])
            return cell
        }
    }
}
