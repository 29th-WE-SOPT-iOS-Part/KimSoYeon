//
//  DelegateVC.swift
//  7th-Seminar
//
//  Created by soyeon on 2021/11/27.
//

import UIKit

class DelegateVC: UIViewController {

    // MARK: - IB Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var warningLabel: UILabel!
    
    // MARK: - Properties
    
    var nameList = [String]()
    var selectedNameList = [String]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initCollectionView()
        initDataList()
    }
    
    // MARK: - init Methods
    
    func initCollectionView() {
        collectionView.register(UINib(nibName: KeywordCVC.identifier, bundle: nil), forCellWithReuseIdentifier: KeywordCVC.identifier)
        collectionView.dataSource = self
    }
    
    func initDataList(){
        nameList.append(contentsOf: ["김루희","김선영","김소연","김수연","김승찬","김윤서","김인환",
                                     "김지수","김태현","김현규","김혜수","박예빈","박익범","배은서",
                                     "송지훈","신윤아","안현주","양수빈","이경민","이남준","이유진",
                                     "이준호","임주민","장혜령","정은희","정정빈","조양원","최은주",
                                     "최이준","홍승현","황지은"])
    }
}

// MARK: - Protocols

extension DelegateVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCVC.identifier, for: indexPath) as? KeywordCVC else { return UICollectionViewCell() }
        cell.setKeyword(text: nameList[indexPath.row])
        
        if nameList[indexPath.row] == "김소연" {
            cell.presentingColosure = {
                guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: FirstVC.identifier) else { return }
                self.present(dvc, animated: true, completion: nil)
            }
        }
        
        cell.keywordDelegate = self
        return cell
    }
}

extension DelegateVC: KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC) {
        selectedNameList.append(cell.keyword)
        updateWarningLabel()
    }
    
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String) {
        let delectingIndex = selectedNameList.firstIndex(of: unselectedName) ?? -1
        selectedNameList.remove(at: delectingIndex)
        updateWarningLabel()
    }
    
    func updateWarningLabel() {
        warningLabel.text = "\(selectedNameList.count)명이 선택되었습니다"
        warningLabel.textColor = selectedNameList.count > 8 ? .systemPink : .black
    }
}
