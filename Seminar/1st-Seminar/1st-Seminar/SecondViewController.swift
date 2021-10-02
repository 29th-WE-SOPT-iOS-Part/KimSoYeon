//
//  SecondViewController.swift
//  1st-Seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemCyan
        
        dismissButton.setTitle("dismiss", for: .normal)
    }
    
    // MARK: - IBActions
    
    @IBAction func touchUpToGoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
