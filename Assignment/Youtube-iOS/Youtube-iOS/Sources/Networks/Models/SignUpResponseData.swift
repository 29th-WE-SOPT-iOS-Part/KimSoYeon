//
//  SignUpResponseData.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/07.
//

import Foundation

struct SignUpResponseData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpResultData?
}

struct SignUpResultData: Codable {
    let id: Int
    let name,email: String
}
