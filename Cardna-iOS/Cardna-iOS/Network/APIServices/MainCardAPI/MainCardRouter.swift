//
//  MainCardRouter.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

import Moya

enum MainCardRouter {
    case getMainCard
    case putMainCard(cardIndexList: [Int])
}

extension MainCardRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getMainCard, .putMainCard(_): return URLConstant.cardMain
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMainCard: return .get
        case .putMainCard(_): return .put
        }
    }
    
    var task: Task {
        switch self {
        case .getMainCard:
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
