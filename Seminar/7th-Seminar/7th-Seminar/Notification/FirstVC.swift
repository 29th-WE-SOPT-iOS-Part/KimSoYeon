//
//  FirstVC.swift
//  7th-Seminar
//
//  Created by soyeon on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {
    static let identifier = "FirstVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - IB Actions
    
    @IBAction func touchUpSendButton(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }
//        dvc.receivedText = self.textField.text ?? "넘겨받은 데이터 없습니다."
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataReceived(_:)), name: NSNotification.Name("iOS-Sample"), object: nil)
        
        present(dvc, animated: true, completion: nil)
    }
    
    @objc
    func dataReceived(_ notification: Notification) {
        if let text = notification.object as? String {
            textField.text = text
        }
    }
}
