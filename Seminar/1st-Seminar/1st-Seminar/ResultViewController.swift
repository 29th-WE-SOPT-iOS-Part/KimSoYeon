//
//  ResultViewController.swift
//  1st-Seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class ResultViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: - Variables
    
    var message: String?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let msg = message {
            dataLabel.text = msg
        }
        
        dismissButton.setTitle("dismiss", for: .normal)
    }
    
    // MARK: - IBActions
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
