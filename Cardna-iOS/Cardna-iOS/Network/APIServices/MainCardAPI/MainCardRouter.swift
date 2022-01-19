//
//  MainCardRouter.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

import Moya

enum MainCardRouter {
    case getMainCard(friendID: Int? = nil)
    case putMainCard(cardIndexList: [Int])
}

extension MainCardRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getMainCard(let friendID):
            if friendID == nil {
                return URLConstant.cardMain
            }
            else {
                guard let friendID = friendID else { return URLConstant.cardMain }
                return "\(URLConstant.cardMain)/\(friendID)"
            }
        case .putMainCard(_): return URLConstant.cardMain
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMainCard(_): return .get
        case .putMainCard(_): return .put
        }
    }
    
    var task: Task {
        switch self {
        case .getMainCard(_):
            return .requestPlain
        case .putMainCard(let indexList):
            return .requestParameters(parameters: ["cards": indexList], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMainCard, .putMainCard(_): return NetworkConstant.hasTokenHeader
        }
    }
}
