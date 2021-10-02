//
//  ViewController.swift
//  29th-week1-seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var testLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = "장혜령 싫어하는거?"
    }

    // MARK: - IBActions
    
    @IBAction func touchUpToChangeLabel(_ sender: Any) {
        testLabel.text = "그거 어떻게 하는건데."
        testLabel.sizeToFit()
    }
    
    @IBAction func touchUpToChangeView(_ sender: Any) {
//        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
//        dvc.modalPresentationStyle = .fullScreen
//        present(dvc, animated: true, completion: nil)
        
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        self.navigationController?.pushViewController(dvc, animated: true)
    }
}

