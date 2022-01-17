//
//  CardPackRouter.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//
//
import Foundation

import Moya

enum CardPackRouter {
    case getCardPackAll(id: Int?)
    case getCardPackMe(id: Int?)
    case getCardPackYou(id: Int?)
}

extension CardPackRouter: BaseTargetType {
    var path: String {
        switch self {
            /// 이후 id 넘겨서 타인의 카드팩도 봐야함!
        case .getCardPackAll(let id):
            return URLConstant.card
        case .getCardPackMe(let id):
            return URLConstant.cardMe
        case .getCardPackYou(let id):
            return URLConstant.cardYou
        }
    }

    var method: Moya.Method {
        switch self {
        case .getCardPackAll(_), .getCardPackMe(_), .getCardPackYou(_):
            return .get
        }
    }

    var task: Task {
        switch self {
        case .getCardPackAll(_), .getCardPackMe(_), .getCardPackYou(_):
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        switch self {
        case .getCardPackAll(_), .getCardPackMe(_), .getCardPackYou(_):
            return NetworkConstant.hasTokenHeader
        }
    }
}
