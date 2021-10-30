//
//  ViewController.swift
//  4th-Seminar
//
//  Created by soyeon on 2021/10/30.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var userTextLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchUpSend(_ sender: Any) {
        requestLogin()
        getUserData()
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: message,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController {
    func requestLogin() {
        UserSignService.shared.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.simpleAlert(title: response.message, message: "\(userData.name)님 환영합니다!")
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func getUserData() {
        UserSignService.shared.readUserData(userId: 2) { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.userTextLabel.text = userData.name
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathERR")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
