//
//  LoginResponse.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

// MARK: - LoginResponse
struct LoginResponse: Codable {
    let email, name, accessToken, refreshToken: String
}
