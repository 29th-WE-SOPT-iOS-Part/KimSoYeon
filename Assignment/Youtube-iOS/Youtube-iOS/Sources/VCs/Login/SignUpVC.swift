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
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image170")
        return imageView
    }()
    
    let titleLabel = UILabel()
    
    let nameTextField = SignTextField(placeholder: "이름을 입력해주세요.")
    let emailTextField = SignTextField(placeholder: "이메일 또는 휴대전화")
    let passwordTextField = SignTextField(placeholder: "비밀번호 입력")
    
    let showPasswordButton = UIButton()
    let nextButton = ConfirmButton(text: "다음", isEnabled: false)
    
    // MARK: - Properties
    
    private var isShow = false

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
        setConstraints()
        setTextField()
        setAddTargetAction()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

// MARK: - Custom Methods

extension SignUpVC {
    func initUI() {
        view.backgroundColor = .white
        
        titleLabel.text = "회원가입"
        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "square")
        configuration.titlePadding = 10
        configuration.imagePadding = 10
        configuration.baseForegroundColor = .lightGray
        configuration.attributedTitle = AttributedString("비밀번호 표시", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
        showPasswordButton.configuration = configuration
    }
    
    func setConstraints() {
        view.addSubviews([logoImage, titleLabel,
                          nameTextField, emailTextField, passwordTextField,
                          showPasswordButton, nextButton])
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(128)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(23)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(128)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(48)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(48)
        }
        
        showPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(22)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(showPasswordButton.snp.bottom).offset(29)
            make.leading.trailing.equalToSuperview().inset(22)
        }
    }
    
    func setAddTargetAction() {
        showPasswordButton.addTarget(self, action: #selector(touchUpShowPassword), for: .touchUpInside)
        
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
        requestSignUp()
    }
}

// MARK: - UITextField Delegate

extension SignUpVC: UITextFieldDelegate {
    func setTextField() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setTextFieldEmpty() {
        [nameTextField, emailTextField, passwordTextField].forEach {
            $0.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if nameTextField.hasText && emailTextField.hasText && passwordTextField.hasText {
            nextButton.isEnabled = true
            nextButton.backgroundColor = .googleBlue
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray
        }
    }
}

// MARK: - Network

extension SignUpVC {
    func requestSignUp() {
        SignUpService.shared.signUp(email: emailTextField.text ?? "",
                                        name: nameTextField.text ?? "",
                                     password: passwordTextField.text ?? "") { responseData in
            switch  responseData {
            case .success(let signupResponse):
                guard let response = signupResponse as? SignUpResponseData else { return }
                if response.data != nil {
                    UserDefaults.standard.set(self.nameTextField.text, forKey: UserDefaults.Keys.signinUserName)
                    self.makeAlert(title: "회원가입", message: response.message, okAction: { _ in
                        let dvc = ConfirmVC()
                        dvc.modalPresentationStyle = .fullScreen
                        self.present(dvc, animated: true, completion: {
                            self.navigationController?.popToRootViewController(animated: true)
                        })
                    })
                }
            case .requestErr(let signupResponse):
                print("requestERR \(signupResponse)")
                guard let response = signupResponse as? SignUpResponseData else { return }
                self.makeAlert(title: "회원가입", message: response.message ,okAction: { _ in
                    self.setTextFieldEmpty()
                })
            case .pathErr(let signupResponse):
                print("pathErr")
                guard let response = signupResponse as? SignUpResponseData else { return }
                self.makeAlert(title: "회원가입", message: response.message, okAction: { _ in
                    self.setTextFieldEmpty()
                })
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
