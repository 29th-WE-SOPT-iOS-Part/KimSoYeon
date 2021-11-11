//
//  ConfirmVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit
import SnapKit

class ConfirmVC: UIViewController {
    
    // MARK: - UI
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image170")
        return imageView
    }()
    
    let welcomeLabel = UILabel()
    let confirmButton = ConfirmButton(text: "확인", isEnabled: true)
    let switchAccountButton = UIButton()
    
    // MARK: - Properties
    
    var userName: String?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        setConstraints()
        setAddTargetAction()
    }
}

// MARK: - Custom Methods

extension ConfirmVC {
    func initUI() {
        view.backgroundColor = .white
        
        if let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.signinUserName) {
            welcomeLabel.text = "\(name)님\n환영합니다!"
        }
        welcomeLabel.font = .systemFont(ofSize: 26, weight: .semibold)
        welcomeLabel.numberOfLines = 2
        welcomeLabel.textAlignment = .center
        
        switchAccountButton.setTitle("다른 계정으로 로그인하기", for: .normal)
        switchAccountButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        switchAccountButton.setTitleColor(.googleBlue, for: .normal)
    }
    
    func setConstraints() {
        view.addSubviews([logoImage, welcomeLabel, confirmButton, switchAccountButton])
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(257)
            make.centerX.equalToSuperview()
        }
        
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        
        confirmButton.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(53)
            make.leading.trailing.equalToSuperview().inset(22)
        }
        
        switchAccountButton.snp.makeConstraints { make in
            make.top.equalTo(confirmButton.snp.bottom).offset(23)
            make.centerX.equalToSuperview()
        }
    }
    
    func setAddTargetAction(){
        confirmButton.addTarget(self, action: #selector(touchUpConfirm), for: .touchUpInside)
        
        switchAccountButton.addTarget(self, action: #selector(touchUpSwitchAccount), for: .touchUpInside)
    }
}

// MARK: - @objc

extension ConfirmVC {
    @objc
    func touchUpConfirm() {
        let dvc = TabBarController()
        dvc.modalPresentationStyle = .fullScreen
        dvc.modalTransitionStyle = .coverVertical
        self.present(dvc, animated: true, completion: nil)
    }
    
    @objc
    func touchUpSwitchAccount() {
        guard let parentVC = presentingViewController as? UINavigationController else { return }
        self.dismiss(animated: true) {
            parentVC.popToRootViewController(animated: true)
        }
    }
}
