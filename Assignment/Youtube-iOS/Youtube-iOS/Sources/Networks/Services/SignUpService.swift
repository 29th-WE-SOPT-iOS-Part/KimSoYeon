//
//  SignUpService.swift
//  Youtube-iOS
//
//  Created by soyeon on 2021/11/07.
//

import Foundation
import Alamofire

struct SignUpService {
    
    static let shared = SignUpService()
    
    func signUp(email: String,
                name: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        let signUpUrl = APIConstants.signupURL
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email": email,
            "name" : name,
            "password": password
        ]
        
        let dataRequest = AF.request(signUpUrl,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeSignUpStatus(by: statusCode, value)
                completion(networkResult)
            case .failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
        
    }
    
    private func judgeSignUpStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidLoginData(data: data)
        case 400: return isUsedPathErrData(data: data)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpResponseData.self, from: data)
            else {return .pathErr(data)}
        return .success(decodedData)
    }
    
    private func isUsedPathErrData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpResponseData.self, from: data)
            else {return .pathErr(data)}
        return .requestErr(decodedData)
    }
    
}
