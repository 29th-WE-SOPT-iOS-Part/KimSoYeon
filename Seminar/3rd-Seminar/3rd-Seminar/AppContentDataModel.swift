//
//  AppContentDataModel.swift
//  3rd-Seminar
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

struct AppContentDataModel {
    let appName: String
    let description: String
    let appIconName: String
    
    func setImage() -> UIImage? {
        return UIImage(named: appIconName)
    }
}
