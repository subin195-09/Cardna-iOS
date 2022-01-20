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
    case getCardNotYetBox
    case putCardORNot(cardID: Int)
    case deleteCard(cardID: Int)
}

extension CardPackRouter: BaseTargetType {
    var path: String {
        switch self {
            /// 이후 id 넘겨서 타인의 카드팩도 봐야함!
        case .getCardPackAll(let id):
            if id == nil {
                return URLConstant.card
            }
            else {
                return "\(URLConstant.card)/\(id ?? 0)"
            }
        case .getCardPackMe(let id):
            if id == nil {
                return URLConstant.cardMe
            }
            else {
                return "\(URLConstant.cardMe)/\(id ?? 0)"
            }
        case .getCardPackYou(let id):
            if id == nil {
                return URLConstant.cardYou
            }
            else {
                return "\(URLConstant.cardYou)/\(id ?? 0)"
            }
        case .getCardNotYetBox:
            return URLConstant.cardBox
        case .putCardORNot(let cardID):
            return "\(URLConstant.cardBox)/\(cardID)"
        case .deleteCard(let cardID):
            return "\(URLConstant.card)/\(cardID)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getCardPackAll(_), .getCardPackMe(_), .getCardPackYou(_), .getCardNotYetBox:
            return .get
        case .putCardORNot:
            return .put
        case .deleteCard(_):
            return .delete
        }
    }

    var task: Task {
        switch self {
        case .getCardPackAll(_), .getCardPackMe(_), .getCardPackYou(_), .getCardNotYetBox, .putCardORNot, .deleteCard(_):
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        switch self {
        case .getCardPackAll(_), .getCardPackMe(_), .getCardPackYou(_), .getCardNotYetBox, .putCardORNot, .deleteCard(_):
            return NetworkConstant.hasTokenHeader
        }
    }
}
