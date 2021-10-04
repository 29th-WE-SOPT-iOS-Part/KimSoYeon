//
//  UIColor+Extension.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, a: Int = 0xFF) {
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(a) / 255.0
        )
    }

    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

internal extension UIColor {
    @nonobjc class var googleBlue: UIColor {
        return UIColor(rgb: 0x4285F4)
    }
}
