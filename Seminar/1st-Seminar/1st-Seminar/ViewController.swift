//
//  ViewController.swift
//  1st-Seminar
//
//  Created by soyeon on 2021/10/02.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    
    @IBOutlet weak var modalButton: UIButton!
    @IBOutlet weak var naviButton: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testLabel.text = "라벨입니다."
        testButton.setTitle("버튼입니다.", for: .normal)
        
        modalButton.setTitle("modal", for: .normal)
        naviButton.setTitle("navigation", for: .normal)
    }

    // MARK: - IBAcions
    
    @IBAction func touchUpToChangeLabel(_ sender: Any) {
        testLabel.text = "WE SOPT 1차 세미나"
        testLabel.sizeToFit()
    }
    
    @IBAction func touchUpToGoSecondView(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        dvc.modalPresentationStyle = .fullScreen
        present(dvc, animated: true, completion: nil)
    }
    
    @IBAction func touchUpToMoveSecondView(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        navigationController?.pushViewController(dvc, animated: true)
    }
    
}

