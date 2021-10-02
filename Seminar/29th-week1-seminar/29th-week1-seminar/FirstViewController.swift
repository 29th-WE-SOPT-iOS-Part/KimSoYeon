//
//  FirstViewController.swift
//  29th-week1-seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpSendData(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else { return }
        dvc.message = dataTextField.text
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
}
