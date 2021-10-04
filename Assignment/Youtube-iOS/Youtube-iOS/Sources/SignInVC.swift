//
//  ViewController.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit
import SnapKit

class SignInVC: UIViewController {

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setConstraints()
        
        setTextField()
        hideKeyboardWhenTappedAround()
    }
}

// MARK: -  Custom Methods

extension SignInVC {
    func initUI() {
        view.backgroundColor = .white
        
        logoLabel.text = "Google"
        logoLabel.font = .boldSystemFont(ofSize: 25)
        
        titleLabel.text = "로그인"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        descriptionlabel.text = "Continue to YouTube. You'll also sign in\nto Google services in your apps & Safari."
        descriptionlabel.numberOfLines = 2
        descriptionlabel.font = .systemFont(ofSize: 13)
        descriptionlabel.textColor = .gray
        descriptionlabel.textAlignment = .center
        
        nameTextField.placeholder = "이름을 입력해주세요."
        nameTextField.layer.borderColor = UIColor.gray.cgColor
        nameTextField.layer.borderWidth = 0.5
        nameTextField.layer.cornerRadius = 8
        nameTextField.setLeftPaddingPoints(20)
        nameTextField.setRightPaddingPoints(20)
    
        contactTextField.placeholder = "이메일 또는 휴대전화"
        contactTextField.layer.borderColor = UIColor.gray.cgColor
        contactTextField.layer.borderWidth = 0.5
        contactTextField.layer.cornerRadius = 8
        contactTextField.setLeftPaddingPoints(20)
        contactTextField.setRightPaddingPoints(20)
        
        passwordTextField.placeholder = "비밀번호 입력"
        passwordTextField.layer.borderColor = UIColor.gray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        passwordTextField.setLeftPaddingPoints(20)
        passwordTextField.setRightPaddingPoints(20)
        
        creatAccountButton.setTitle("계정 만들기", for: .normal)
        creatAccountButton.setTitleColor(.googleBlue, for: .normal)
        
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .gray
        nextButton.layer.cornerRadius = 8
        nextButton.layer.masksToBounds = true
        nextButton.isEnabled = false
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
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        contactTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(contactTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        creatAccountButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(70)
            make.leading.equalToSuperview().inset(30)
        }
        creatAccountButton.addTarget(self, action: #selector(touchUpCreate), for: .touchUpInside)
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(70)
            make.trailing.equalToSuperview().inset(30)
            make.width.equalTo(70)
        }
    }
}

// MARK: - @objc

extension SignInVC {
    @objc
    func touchUpCreate() {
        let dvc = SignUpVC()
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

// MARK: - UITextField Delegate

extension SignInVC: UITextFieldDelegate {
    func setTextField() {
        nameTextField.delegate = self
        contactTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.text != "" && contactTextField.text != "" && passwordTextField.text != "" {
            nextButton.isEnabled = true
            nextButton.backgroundColor = .googleBlue
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray
        }
    }
}

