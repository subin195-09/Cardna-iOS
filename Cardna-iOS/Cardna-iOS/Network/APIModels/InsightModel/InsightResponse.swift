//
//  InsightResponse.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

// MARK: - InsightResponse
struct InsightResponse: Codable {
    let openAreaCard, blindAreaCard: AreaCard?
}

// MARK: - AreaCard
struct AreaCard: Codable {
    let id: Int?
    let title: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, title
        case imageURL = "imageUrl"
    }
}
