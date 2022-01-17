//
//  LoginService.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

import Moya

public class LoginService {
    static let shared = LoginService()
    var loginProvider = MoyaProvider<LoginRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func postLogin(parameter: LoginRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        loginProvider.request(.postLogin(parameter: parameter)) { result in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isValidLoginData(data: data)
        case 400..<500:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<LoginResponse>.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData)
    }
}
