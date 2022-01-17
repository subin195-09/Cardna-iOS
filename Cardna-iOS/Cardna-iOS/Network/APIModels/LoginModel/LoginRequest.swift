//
//  LoginRequest.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

// MARK: - LoginRequest
struct LoginRequest: Codable {
    let email, password: String
}
