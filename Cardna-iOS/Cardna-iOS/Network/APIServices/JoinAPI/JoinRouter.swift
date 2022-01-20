//
//  JoinRouter.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/20.
//

import Foundation

import Moya

enum JoinRouter {
    case postJoin(parameter: JoinRequest)
}

extension JoinRouter: BaseTargetType {
    var path: String {
        switch self {
        case .postJoin: return URLConstant.authSignUpEmail
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postJoin: return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postJoin(let parameter):
            let parameter: [String: Any] = ["email": parameter.email,
                                            "name": parameter.name,
                                            "password": parameter.password]
            return .requestParameters(parameters: parameter, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postJoin: return NetworkConstant.noTokenHeader
        }
    }
}
