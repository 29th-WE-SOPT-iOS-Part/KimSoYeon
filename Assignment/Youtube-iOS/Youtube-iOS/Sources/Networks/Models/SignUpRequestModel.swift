//
//  SignUpResponseData.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/07.
//

import Foundation

// MARK: - RequestModel

struct SignUpRequestModel: Codable {
    let email, name, password: String
}
