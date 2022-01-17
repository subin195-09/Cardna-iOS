//
//  EmailSearchRouter.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

import Moya

enum EmailSearchRouter {
    case getFriendbyEmailSearch(email: String)
}

extension EmailSearchRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getFriendbyEmailSearch(let email):
            return URLConstant.friendSearch
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getFriendbyEmailSearch(_): return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getFriendbyEmailSearch(let email): return .requestParameters(parameters: ["email": email], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getFriendbyEmailSearch(_): return NetworkConstant.hasTokenHeader
        }
    }
    
    
}
