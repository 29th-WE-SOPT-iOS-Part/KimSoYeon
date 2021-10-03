//
//  ConfirmVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit

class ConfirmVC: UIViewController {
    
    // MARK: - Properties
    
    let logoLabel = UILabel()
    let welcomeLabel = UILabel()
    let confirmButton = UIButton()
    
    var userName: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        setConstraints()
    }
    
}

extension ConfirmVC {
    func initUI() {
        view.backgroundColor = .white
        
        logoLabel.text = "Google"
        logoLabel.font = .boldSystemFont(ofSize: 25)
        
        if let name = userName {
            welcomeLabel.text = "\(name)\n환영합니다!"
        }
        welcomeLabel.font = .boldSystemFont(ofSize: 20)
        welcomeLabel.numberOfLines = 2
        welcomeLabel.textAlignment = .center
        
        confirmButton.setTitle("확인", for: .normal)
        confirmButton.backgroundColor = UIColor(hexString: "#4285F4")
        confirmButton.layer.cornerRadius = 10
        confirmButton.layer.masksToBounds = true
    }
    
    func setConstraints() {
        view.addSubviews([logoLabel, welcomeLabel, confirmButton])
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        confirmButton.addTarget(self, action: #selector(touchUpConfirm), for: .touchUpInside)
    }
}

extension ConfirmVC {
    @objc
    func touchUpConfirm() {
        print("확인 버튼 누름")
    }
}
