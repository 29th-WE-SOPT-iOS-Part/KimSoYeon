//
//  TabBarVC.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/15.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
        initUI()
        setTabs()
    }
}

extension TabBarController {
    func initUI() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().tintColor = .black
        
        if #available(iOS 15, *) {
            let appearance = UITabBarAppearance()
            let tabBar = UITabBar()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            appearance.selectionIndicatorTintColor = .black
            tabBar.standardAppearance = appearance;
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    func setTabs() {
        let homeTab = HomeVC()
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIcon"), selectedImage: UIImage(named: "homeIconFill"))
        
        let shortsTab = ShortsVC()
        shortsTab.tabBarItem = UITabBarItem(title: "shorts", image: UIImage(named: "shortIcon"), selectedImage: UIImage(named: "shortIcon"))
        
        let addTab = AddVC()
        addTab.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plueCircleIcon"), selectedImage: UIImage(named: "plueCircleIcon"))
        
        let subscribeTab = UINavigationController(rootViewController: SubscriptionsVC())
        subscribeTab.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))
        
        let libraryTab = LibraryVC()
        libraryTab.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))
        
        let tabs =  [homeTab, shortsTab, addTab, subscribeTab, libraryTab]
        
        let fontAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)]
        UITabBarItem.appearance().setTitleTextAttributes(fontAttributes as [NSAttributedString.Key : Any], for: .normal)
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
}
