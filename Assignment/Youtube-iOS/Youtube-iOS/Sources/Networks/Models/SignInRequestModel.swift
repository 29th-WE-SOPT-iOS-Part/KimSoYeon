//
//  LoginDataModel.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/06.
//

import Foundation

// MARK: - RequestModel

struct SignInRequestModel: Codable {
    let email, password: String
}

