//
//  BaseTargetType.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/16.
//

import Moya

protocol BaseTargetType: TargetType { }

extension BaseTargetType {

    var baseURL: URL {
        return URL(string: URLConstant.baseURL)!
    }
    
    var sampleData: Data {
        return Data()
    }
}
