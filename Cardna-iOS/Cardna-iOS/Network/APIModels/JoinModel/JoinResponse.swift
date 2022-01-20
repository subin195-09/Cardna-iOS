//
//  JoinResponse.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/20.
//

import Foundation

// MARK: - JoinResponse
struct JoinResponse: Codable {
    let email, name, accessToken, refreshToken: String
}
