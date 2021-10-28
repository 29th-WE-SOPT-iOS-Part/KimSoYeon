//
//  SignTextField.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/11.
//

import UIKit

class SignTextField: UITextField {
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
        self.placeholder = placeholder
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Custom Methods
    
    func initUI() {
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 0.5
        layer.cornerRadius = 8
        
        setLeftPaddingPoints(20)
        setRightPaddingPoints(20)
    }
}
