//
//  UIView+Extensions.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/10/03.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

