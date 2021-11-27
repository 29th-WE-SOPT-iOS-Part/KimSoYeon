//
//  KeywordCVC.swift
//  7th-Seminar
//
//  Created by soyeon on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnselected(cell: KeywordCVC, unselectedName: String)
}

class KeywordCVC: UICollectionViewCell {
    static let identifier = "KeywordCVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var keywordButton: UIButton!
    
    // MARK: - Properties
    
    var keyword: String = ""
    var selectedKeyword: Bool = false
    
    var keywordDelegate: KeywordCellDelegate?
    var presentingColosure: (() -> ())?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        keywordButton.setTitleColor(.lightGray, for: .normal)
    }
    
    @IBAction func touchUpKeywordButton(_ sender: Any) {
        if selectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self, unselectedName: keyword)
            keywordButton.setTitleColor(.lightGray, for: .normal)
            keywordButton.backgroundColor = .clear
        } else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.setTitleColor(.black, for: .normal)
            keywordButton.backgroundColor = .systemGray6
            presentingColosure?()
        }
        selectedKeyword.toggle()
    }
    
    func setKeyword(text: String) {
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }

}
