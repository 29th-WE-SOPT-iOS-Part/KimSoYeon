//
//  UserService.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/12.
//

import UIKit
import Alamofire

struct UserService {
    static let shared = UserService()
    
    // MARK: - SignIn
    
    func signIn(email: String, password: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        AF.request(UserRouter.signIn(signIn: SignInRequestModel(email: email, password: password)))
            .validate(statusCode: 200...500)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    switch response.response?.statusCode {
                    case 200, 400:
                        guard let jsonData = try? JSONDecoder().decode(UserResponseModel.self, from: data) else { return }
                        return completion(.success(jsonData))
                        
                    default: completion(.networkFail)
                    }
                    
                case .failure(let err):
                    print(err)
                }
            }
    }
    
    // MARK: - SignUp
    
    func signUp(email: String, name: String, password: String,
                completion: @escaping (NetworkResult<Any>) -> Void) {
        
        AF.request(UserRouter.signUp(signUp: SignUpRequestModel(email: email, name: name, password: password)))
            .validate(statusCode: 200...500)
            .responseData { res in
                switch res.result {
                case .success(let data):
                    print(res)
                    switch res.response?.statusCode {
                    case 200, 400:
                        guard let jsonData = try? JSONDecoder().decode(UserResponseModel.self, from: data) else { return }
                        return completion(.success(jsonData))
                        
                    default: completion(.networkFail)
                    }
                    
                case .failure(let err):
                    print(err)
                }
            }
    }
}
