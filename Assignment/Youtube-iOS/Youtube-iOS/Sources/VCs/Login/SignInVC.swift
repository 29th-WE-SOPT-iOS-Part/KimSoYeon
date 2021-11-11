//
//  ViewController.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit
import SnapKit

class SignInVC: UIViewController {

    // MARK: - UI
    
    let logoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image170")
        return imageView
    }()
    
    let titleLabel = UILabel()
    let descriptionlabel = UILabel()
    
    let nameTextField = SignTextField(placeholder: "이름을 입력해주세요.")
    let emailTextField = SignTextField(placeholder: "이메일 또는 휴대전화")
    let passwordTextField = SignTextField(placeholder: "비밀번호 입력")
    
    let creatAccountButton = UIButton()
    let nextButton = ConfirmButton(text: "다음", isEnabled: false)
    
    let textTableView = UITableView()
    
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
        setAddTargetAction()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

// MARK: -  Custom Methods

extension SignInVC {
    func initUI() {
        view.backgroundColor = .white
        
        titleLabel.text = "로그인"
        titleLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        descriptionlabel.text = "Youtube로 이동하여 계속하세요.\n앱 및 Safari에서도 Google 서비스에 로그인됩니다."
        descriptionlabel.numberOfLines = 2
        descriptionlabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionlabel.textColor = .darkGray
        descriptionlabel.textAlignment = .center
        
        passwordTextField.textContentType = .password
        passwordTextField.isSecureTextEntry = true
        
        creatAccountButton.setTitle("계정 만들기", for: .normal)
        creatAccountButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        creatAccountButton.setTitleColor(.googleBlue, for: .normal)
    }
    
    func setConstraints() {
        view.addSubviews([logoImage, titleLabel, descriptionlabel,
                          nameTextField, emailTextField, passwordTextField,
                          creatAccountButton, nextButton])
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(128)
            make.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(22)
            make.centerX.equalToSuperview()
        }
        
        descriptionlabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(14)
            make.centerX.equalToSuperview()
        }
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(descriptionlabel.snp.bottom).offset(68)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(48)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(48)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(17)
            make.leading.trailing.equalToSuperview().inset(22)
            make.height.equalTo(48)
        }
        
        creatAccountButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(73)
            make.leading.equalToSuperview().inset(22)
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(64)
            make.trailing.equalToSuperview().inset(22)
            make.width.equalTo(74)
        }
    }
    
    func setAddTargetAction() {
        creatAccountButton.addTarget(self, action: #selector(touchUpCreate), for: .touchUpInside)
        
        nextButton.addTarget(self, action: #selector(touchUpNext), for: .touchUpInside)
    }
    
    func loginAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default){ _ in
            let dvc = ConfirmVC()
            dvc.modalPresentationStyle = .fullScreen
            self.present(dvc, animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - @objc

extension SignInVC {
    @objc
    func touchUpCreate() {
        let dvc = SignUpVC()
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
    @objc
    private func touchUpNext() {
        requestSignIn()
    }
}

// MARK: - UITextField Delegate

extension SignInVC: UITextFieldDelegate {
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

extension SignInVC {
    func requestSignIn() {
        LoginService.shared.login(email: emailTextField.text ?? "",
                                      password: passwordTextField.text ?? "") { [self] responseData in
            switch  responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if response.data != nil {
                    self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                        let dvc = ConfirmVC()
                        dvc.modalPresentationStyle = .fullScreen
                        self.present(dvc, animated: true, completion: nil)
                    })
                }
            case .requestErr(let loginResponse):
                print("requestERR \(loginResponse)")
                guard let response = loginResponse as? LoginResponseData else { return }
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    setTextFieldEmpty()
                })
            case .pathErr(let loginResponse):
                print("pathErr")
                guard let response = loginResponse as? LoginResponseData else { return }
                self.makeAlert(title: "로그인", message: response.message, okAction: { _ in
                    setTextFieldEmpty()
                })
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
