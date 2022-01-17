//
//  InsightRouter.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

import Moya

enum InsightRouter {
    case getInsight
}

extension InsightRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getInsight: return URLConstant.insight
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getInsight: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getInsight: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getInsight: return NetworkConstant.hasTokenHeader
        }
    }
}
