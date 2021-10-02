//
//  FirstViewController.swift
//  1st-Seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class FirstViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sendButton.setTitle("send", for: .normal)
    }
    
    // MARK: - IBActions
    
    @IBAction func touchUpToSendData(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        dvc.message = dataTextField.text
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
}
