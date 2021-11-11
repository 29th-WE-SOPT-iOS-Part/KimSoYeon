//
//  UserRouter.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/12.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible {
    
    case signIn(signIn: SignInRequestModel)
    case signUp(signUp: SignUpRequestModel)
    
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var method: HTTPMethod {
        switch self {
        case .signIn, .signUp: return .post
        }
    }
    
    var path: String {
        switch self {
        case .signIn: return APIConstants.signinURL
        case .signUp: return APIConstants.signupURL
        }
    }
    
    var headers: [String: String] {
        switch self {
        case .signIn, .signUp: return ["Content-Type": "application/json"]
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .signIn(let signIn): return ["email": signIn.email,
                                            "password": signIn.password]
        case .signUp(let signUp): return ["email": signUp.email,
                                          "name": signUp.name,
                                          "password": signUp.password]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        
        var request = URLRequest(url: url)
        request.method = method
        request.headers = HTTPHeaders(headers)
        
        switch self {
        case .signIn, .signUp: request = try JSONParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}
