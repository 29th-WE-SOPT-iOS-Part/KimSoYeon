//
//  ViewController.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {

    // MARK: - Properties
    
    let logoLabel = UILabel()
    let titleLabel = UILabel()
    let descriptionlabel = UILabel()
    
    let nameTextField = UITextField()
    let contactTextField = UITextField()
    let passwordTextField = UITextField()
    
    let creatAccountButton = UIButton()
    let nextButton = UIButton()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setConstraints()
        setActions()
    }

}

// MARK: -  Custom Methods

extension LoginVC {
    func initUI() {
        view.backgroundColor = .white
        
        logoLabel.text = "Google"
        logoLabel.font = .boldSystemFont(ofSize: 25)
        
        titleLabel.text = "로그인"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionlabel.text = "Youtube도 이동하며 계속하세요.\n앱 및 사파리에서도 Google 서비스에 로그인됩니다."
        descriptionlabel.numberOfLines = 2
        descriptionlabel.font = .systemFont(ofSize: 13)
        descriptionlabel.textColor = .gray
        descriptionlabel.textAlignment = .center
        
        nameTextField.placeholder = "이름을 입력해주세요."
        contactTextField.placeholder = "이메일 또는 휴대전화"
        passwordTextField.placeholder = "비밀번호 입력"
        
        creatAccountButton.setTitle("계정 만들기", for: .normal)
        creatAccountButton.setTitleColor(UIColor(hexString: "#4285F4"), for: .normal)
        
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = UIColor(hexString: "#4285F4")
        nextButton.layer.cornerRadius = 8
        nextButton.layer.masksToBounds = true
    }
    
    func setConstraints() {
        view.addSubviews([logoLabel, titleLabel, descriptionlabel,
                          nameTextField, contactTextField, passwordTextField,
                          creatAccountButton, nextButton])
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        descriptionlabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionlabel.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(80)
        }
        
        contactTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(80)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(contactTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(50)
            make.height.equalTo(80)
        }
        
        creatAccountButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(70)
            make.leading.equalToSuperview().inset(50)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(70)
            make.trailing.equalToSuperview().inset(50)
            make.width.equalTo(70)
        }
    }
    
    func setActions() {
        let touchUpCreateButton = UIAction { _ in
            print("계정만들기 버튼 누름")
        }
        creatAccountButton.addAction(touchUpCreateButton, for: .touchUpInside)
        
        let touchUpNextButton = UIAction { _ in
            print("다음 버튼 누름")
        }
        nextButton.addAction(touchUpNextButton, for: .touchUpInside)
    }
}

