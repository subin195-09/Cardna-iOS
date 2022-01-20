//
//  AddCardRequest.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/17.
//

import Foundation

// MARK: - AddCardRequest

struct AddCardRequest: Codable {
    let title, content: String
    let symbolId: Int?
    let img: [Data]
}

// MARK: - AddCardResponse
struct AddCardResponse: Codable {
    let id: Int
    let isMe: Bool
    let title, content, relation, createdAt: String
    let imageURL: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id, isMe, title, content, relation, createdAt
        case imageURL = "imageUrl"
        case name
    }
}
