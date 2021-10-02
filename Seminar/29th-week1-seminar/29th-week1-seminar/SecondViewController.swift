//
//  SecondViewController.swift
//  29th-week1-seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func dismissToFirstView(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
