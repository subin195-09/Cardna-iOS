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
}

extension MainCardRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getMainCard: return URLConstant.cardMain
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMainCard: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMainCard:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMainCard: return NetworkConstant.hasTokenHeader
        }
    }
}
