//
//  SignUpVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit
import SnapKit

class SignUpVC: UIViewController {
    
    // MARK: - UI
    
    let logoLabel = UILabel()
    let titleLabel = UILabel()
    
    let nameTextField = UITextField()
    let contactTextField = UITextField()
    let passwordTextField = UITextField()
    
    let showPasswordButton = UIButton()
    let nextButton = UIButton()
    
    // MARK: - Properties
    
    private var isShow = false

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        setConstraints()
        
        setTextField()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

// MARK: - Custom Methods

extension SignUpVC {
    func initUI() {
        view.backgroundColor = .white
        
        logoLabel.text = "Google"
        logoLabel.font = .boldSystemFont(ofSize: 25)
        
        titleLabel.text = "회원가입"
        titleLabel.font = .boldSystemFont(ofSize: 20)
        
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
        
        nextButton.setTitle("다음", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = .gray
        nextButton.layer.cornerRadius = 8
        nextButton.layer.masksToBounds = true
        nextButton.isEnabled = false
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "square")
        configuration.titlePadding = 10
        configuration.imagePadding = 10
        configuration.baseForegroundColor = .lightGray
        configuration.attributedTitle = AttributedString("비밀번호 표시", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
        showPasswordButton.configuration = configuration
        showPasswordButton.addTarget(self, action: #selector(touchUpShowPassword), for: .touchUpInside)
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
        
        showPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().inset(30)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(showPasswordButton.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        nextButton.addTarget(self, action: #selector(touchUpNext), for: .touchUpInside)
    }
}

// MARK: - @objc

extension SignUpVC {
    @objc
    private func touchUpShowPassword() {
        if !isShow {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "checkmark.square.fill")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = .googleBlue
            configuration.attributedTitle = AttributedString("비밀번호 표시", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            showPasswordButton.configuration = configuration
            
            passwordTextField.isSecureTextEntry = false
        } else {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: "square")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = .lightGray
            configuration.attributedTitle = AttributedString("비밀번호 표시", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            showPasswordButton.configuration = configuration
            
            passwordTextField.isSecureTextEntry = true
        }
        isShow.toggle()
    }
    
    @objc
    private func touchUpNext() {
        let dvc = ConfirmVC()
        dvc.userName = nameTextField.text
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true) {
            self.nameTextField.text = nil
            self.contactTextField.text = nil
            self.passwordTextField.text = nil
        }
    }
}

// MARK: - UITextField Delegate

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
