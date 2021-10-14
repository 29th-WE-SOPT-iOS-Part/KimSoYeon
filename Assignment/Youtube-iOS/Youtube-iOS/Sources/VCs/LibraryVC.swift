//
//  LibraryVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/15.
//

import UIKit

class LibraryVC: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
    }
}

extension LibraryVC {
    func initUI() {
        view.backgroundColor = .systemBrown
    }
}
