//
//  EmailSearchResponse.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

// MARK: - EmailSearchResponse
struct EmailSearchResponse: Codable {
    let id: Int
    let name: String
    let userImg: String
    let isFriend: Bool
    let email: String
}
