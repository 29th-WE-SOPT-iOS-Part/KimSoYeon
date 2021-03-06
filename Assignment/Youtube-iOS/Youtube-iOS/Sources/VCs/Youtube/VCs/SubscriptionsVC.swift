//
//  SubscribeVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/15.
//

import UIKit
import SnapKit
import Alamofire

class SubscriptionsVC: UIViewController {
    
    // MARK: - UI
    
    private var topView = TopView()
    private var collectionViews = SubscriptionsHeaderView()
    
    private var videoTableView = UITableView()

    // MARK: - Properties
    
    private var videoList = [VideoDataModel]()

    // MARK: - Life Cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.delegate = self
        
        initUI()
        setConstraints()
        
        setData()
        setTableView()
    }
}

// MARK: - Custom Methods

extension SubscriptionsVC {
    private func initUI() {
        view.backgroundColor = .white
    }
    
    private func setConstraints() {
        view.addSubviews([topView, collectionViews, videoTableView])
        
        topView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        collectionViews.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(154)
        }
        
        videoTableView.snp.makeConstraints { make in
            make.top.equalTo(collectionViews.snp.bottom)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
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
    }
    
    private func setTableView() {
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        let videoNib = UINib(nibName: VideoTVC.identifier, bundle: nil)
        videoTableView.register(videoNib, forCellReuseIdentifier: VideoTVC.identifier)
    }
}

// MARK: - Protocols

extension SubscriptionsVC: TopViewDelegate {
    func didTapProfileIcon() {
        let dvc = UINavigationController(rootViewController: SignInVC())
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
}

extension SubscriptionsVC: VideoCellDelegate {
    func didTapThumnailImage(index: Int) {
        let dvc = DetailVC()
        dvc.videoTitle = videoList[index].title
        dvc.videoDescription = "\(videoList[index].channelName) \(videoList[index].views)만 회 \(videoList[index].date)전"
        dvc.modalTransitionStyle = .coverVertical
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}

// MARK: - UITableView Delegate

extension SubscriptionsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailVC()
        self.navigationController?.pushViewController(dvc, animated: true)
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
        cell.setData(index: indexPath.row, thumnailImage: data.thumbnailImage, profileImage: data.profileImage, title: data.title, channelName: data.channelName, views: data.views, date: data.date)
        cell.videoCellDelegate = self
        cell.selectionStyle = .none
        return cell
    }
}
