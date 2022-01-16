//
//  MainCardResponse.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

// MARK: - MainCardResponse
struct MainCardResponse: Codable {
    let isMyCard: Bool
    let isFriend: Bool?
    let mainCardList: [MainCardList]
}

// MARK: - MainCardList
struct MainCardList: Codable {
    let id, mainOrder: Int
    let isMe: Bool
    let cardImg: String
    let title: String
}
