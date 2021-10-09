//
//  TabbarController.swift
//  2nd-Seminar
//
//  Created by soyeon on 2021/10/09.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBar()
    }
    
    func setTabBar() {
        guard let yellowVC = self.storyboard?.instantiateViewController(identifier: "YellowVC"),
              let greenVC = self.storyboard?.instantiateViewController(identifier: "GreenVC") else { return }
        
        yellowVC.tabBarItem.title = "Home"
        yellowVC.tabBarItem.image = UIImage(systemName: "house")
        yellowVC.tabBarItem.image = UIImage(systemName: "house.fill")
        
        greenVC.tabBarItem.title = "Person"
        greenVC.tabBarItem.image = UIImage(systemName: "person")
        greenVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        setViewControllers([yellowVC, greenVC], animated: true)
    }
}
