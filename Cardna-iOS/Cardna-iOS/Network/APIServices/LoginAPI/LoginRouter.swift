//
//  LoginRouter.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

import Moya

enum LoginRouter {
    case postLogin(parameter: LoginRequest)
}

extension LoginRouter: BaseTargetType {
    var path: String {
        switch self {
        case .postLogin: return URLConstant.authLoginEmail
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postLogin: return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postLogin(let parameter):
            let parameter: [String: Any] = ["email": parameter.email,
                                            "password": parameter.password]
            return .requestParameters(parameters: parameter, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postLogin: return NetworkConstant.noTokenHeader
        }
    }
}
