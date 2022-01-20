//
//  JoinRequest.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/20.
//

import Foundation

// MARK: - JoinRequest
struct JoinRequest: Codable {
    let name: String
    let email: String
    let password: String
}
