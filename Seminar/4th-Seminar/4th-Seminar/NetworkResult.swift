//
//  NetworkResult.swift
//  4th-Seminar
//
//  Created by soyeon on 2021/10/30.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
