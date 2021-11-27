//
//  GestureWithCodeVC.swift
//  7th-Seminar
//
//  Created by soyeon on 2021/11/27.
//

import UIKit

class GestureWithCodeVC: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecoginizer:)))
        let tapRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(tapView(gestureRecoginizer:)))
        
        testView.addGestureRecognizer(tapRecognizer1)
    }
    
    @objc
    func tapView(gestureRecoginizer: UIGestureRecognizer) {
        print("View Tapped With Code")
    }
}
