//
//  SecondVC.swift
//  7th-Seminar
//
//  Created by soyeon on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {
    static let identifier = "SecondVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    // MARK: - Properties
    
    var receivedText = ""
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = receivedText
    }
    
    // MARK: - IB Actions

    @IBAction func touchUpSendButton(_ sender: Any) {
        
        NotificationCenter.default.post(name: NSNotification.Name("Sample-iOS"), object: textField.text ?? "넘길 데이터 없습니다.")
        
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.textField.text = self.textField.text
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Custom Methods
    
    func setDataInTextField(data: String) {
        textField.text = data
    }
}
