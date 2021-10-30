//
//  APIConstants.swift
//  4th-Seminar
//
//  Created by soyeon on 2021/10/30.
//

import Foundation

struct APIConstants {
    static let baseURL = "https://asia-northeast3-we-sopt-29.cloudfunctions.net/api"
    
    static let loginURL = baseURL + "/user/login"
    static let readUserURL = baseURL + "/user/"
}
