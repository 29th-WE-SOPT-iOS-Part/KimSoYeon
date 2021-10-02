//
//  ResultViewController.swift
//  29th-week1-seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var dataTextLabel: UILabel!
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataLabel()
    }
    
    func setDataLabel() {
        if let msg = message {
            dataTextLabel.text = msg
            dataTextLabel.sizeToFit()
        }
    }
    
    @IBAction func touchUpToFirstView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
