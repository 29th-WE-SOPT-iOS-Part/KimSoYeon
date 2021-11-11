//
//  APIConstants.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/06.
//

import Foundation
struct APIConstants {
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    static let loginURL = baseURL + "/user/login"
    static let signupURL = baseURL + "/user/signup"
}
