//
//  UserResponseModel.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/12.
//

import Foundation

// MARK: - ResponseModel

struct UserResponseModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: UserResponseData?
}

struct UserResponseData: Codable {
    let id: Int
    let name, email: String
}
