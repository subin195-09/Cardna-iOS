//
//  CardDetailRouter.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

import Moya

enum CardDetailRouter {
    case getCardDetail(cardID: Int)
}

extension CardDetailRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getCardDetail(let id): return "\(URLConstant.cardInfo)/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getCardDetail(_): return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getCardDetail(_): return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCardDetail: return NetworkConstant.hasTokenHeader
        }
    }
}
