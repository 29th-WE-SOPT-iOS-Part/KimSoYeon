//
//  NextButton.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/14.
//

import UIKit

class ConfirmButton: UIButton {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    convenience init(text: String, isEnabled: Bool) {
        self.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.isEnabled = isEnabled
        if isEnabled {
            self.backgroundColor = .googleBlue
        } else {
            self.backgroundColor = .gray
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Custom Methods
    
    func initUI() {
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
}
