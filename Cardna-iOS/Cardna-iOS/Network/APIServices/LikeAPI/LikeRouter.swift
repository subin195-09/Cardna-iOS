//
//  LikeRouter.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/20.
//

import Foundation

import Moya

enum LikeRouter {
    case postLike(cardID: Int)
}

extension LikeRouter: BaseTargetType {
    var path: String {
        switch self {
        case .postLike(_):
            return URLConstant.like
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postLike(_):
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postLike(let cardID):
            return .requestParameters(parameters: ["cardId": cardID], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postLike(_):
            return NetworkConstant.hasTokenHeader
        }
    }
}
