//
//  SignUpVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit
import SnapKit

class SignUpVC: UIViewController {
    
    // MARK: - Properties
    
    let logoLabel = UILabel()
    let titleLabel = UILabel()
    
    let nameTextField = UITextField()
    let contactTextField = UITextField()
    let passwordTextField = UITextField()
    
    let showPasswordButton = UIButton()
    let nextButton = UIButton()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        setConstraints()
        
        setTextField()
    }
}

extension SignUpVC {
    func initUI() {
        view.backgroundColor = .white
        
        logoLabel.text = "Google"
        logoLabel.font = .boldSystemFont(ofSize: 25)
        
        titleLabel.text = "회원가입"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
        nameTextField.placeholder = "이름을 입력해주세요."
        contactTextField.placeholder = "이메일 또는 휴대전화"
        passwordTextField.placeholder = "비밀번호 입력"
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        
        showPasswordButton.setTitle("비밀번호 표시", for: .normal)
        showPasswordButton.setTitleColor(.black, for: .normal)
        
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = UIColor(hexString: "#4285F4")
        nextButton.layer.cornerRadius = 8
        nextButton.layer.masksToBounds = true
    }
    
    func setConstraints() {
        view.addSubviews([logoLabel, titleLabel,
                          nameTextField, contactTextField, passwordTextField,
                          showPasswordButton, nextButton])
        
        logoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
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
        
        showPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(50)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(showPasswordButton.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(50)
        }
        nextButton.addTarget(self, action: #selector(touchUpNext), for: .touchUpInside)
    }
}

// MARK: - @objc

extension SignUpVC {
    @objc
    func touchUpNext() {
        if nameTextField.hasText, contactTextField.hasText, passwordTextField.hasText {
            let confirmVC = ConfirmVC()
            confirmVC.userName = self.nameTextField.text
            confirmVC.modalPresentationStyle = .fullScreen
            self.present(confirmVC, animated: true, completion: {
                self.nameTextField.text = nil
                self.contactTextField.text = nil
                self.passwordTextField.text = nil
            })
        } else {
            let alert = UIAlertController(title: "회원가입 실패",
                                          message: "모두 입력해주세요. 😭",
                                          preferredStyle: UIAlertController.Style.alert)
            let closeAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alert.addAction(closeAction)
            present(alert, animated: true, completion: {
                self.nameTextField.text = nil
                self.contactTextField.text = nil
                self.passwordTextField.text = nil
            })
        }
    }
}

extension SignUpVC: UITextFieldDelegate {
    func setTextField() {
        nameTextField.delegate = self
        contactTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
