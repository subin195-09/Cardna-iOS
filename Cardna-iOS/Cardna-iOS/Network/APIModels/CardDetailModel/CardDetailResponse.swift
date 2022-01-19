//
//  CardDetailResponse.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

// MARK: - CardDetailResponse

struct CardDetailResponse: Codable {
    let id: String
    let isMe, isCard: Bool
    let cardImg: String
    let title, content: String
    let relation, name: String?
    let createdAt: String
    let isLiked: Bool?
}
