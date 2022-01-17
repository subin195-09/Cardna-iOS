//
//  AddFriendRouter.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/18.
//

import Foundation

import Moya

enum AddFriendRouter {
    case postAddFriend(parameter: AddFriendRequest)
}

extension AddFriendRouter: BaseTargetType {
    var path: String {
        switch self {
        case .postAddFriend: return URLConstant.friend
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .postAddFriend: return .post
        }
    }
    
    var task: Task {
        switch self {
        case .postAddFriend(let parameter):
            let parameter: [String: Any] = ["friendId" : parameter.friendID]
            return .requestParameters(parameters: parameter, encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .postAddFriend: return NetworkConstant.hasTokenHeader
        }
    }
}
