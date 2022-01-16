//
//  MyPageRouter.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

import Moya

enum MyPageRouter {
    case getMyPage
}

extension MyPageRouter: BaseTargetType {
    var path: String {
        switch self {
        case .getMyPage: return URLConstant.myPage
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMyPage: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMyPage: return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMyPage: return NetworkConstant.hasTokenHeader
        }
    }
    
    
}
