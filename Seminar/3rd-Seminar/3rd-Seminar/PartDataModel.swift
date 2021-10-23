//
//  PartDataModel.swift
//  3rd-Seminar
//
//  Created by soyeon on 2021/10/23.
//

import UIKit

struct PartDataModel {
    var imageName: String
    var partName: String
    
    func setImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
