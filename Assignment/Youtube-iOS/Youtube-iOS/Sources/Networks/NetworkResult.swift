//
//  NetworkResult.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/06.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr(T)
    case serverErr
    case networkFail 
}
