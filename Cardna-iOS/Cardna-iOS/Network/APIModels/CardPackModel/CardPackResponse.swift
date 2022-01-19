//
//  CardPackResponse.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

// MARK: - CardPackResponse

struct CardPackAllResponse: Codable {
    let totalCardCnt: Int
    let isMyCard: Bool
    let cardMeList: [CardMeList]
    var cardYouList: [CardYouList]
}

// MARK: - CardPackMeResponse

struct CardPackMeResponse: Codable {
    let totalCardCnt: Int
    let isMyCard: Bool
    var cardMeList: [CardMeList]
}

// MARK: - CardPackYouResponse

struct CardPackYouResponse: Codable {
    let totalCardCnt: Int
    let isMyCard: Bool
    var cardYouList: [CardYouList]
}

// MARK: - CardMeList

struct CardMeList: Codable {
    let id: Int
    let title: String
    let cardImg: String
    var mainOrder: Int?
    let isLiked: Bool?
    
    mutating func changeMainState(order: Int?) {
        self.mainOrder = order
    }

}

// MARK: - CardMeList

struct CardYouList: Codable {
    let id: Int
    let title: String
    let cardImg: String
    var mainOrder: Int?
    let isLiked: Bool?
    
    mutating func changeMainState(order: Int?) {
        self.mainOrder = order
    }
}

// MARK: - CardNotYet
struct CardNotYet: Codable {
    let id: Int
    let title, relation, name, createdAt: String
    let isImage: Bool
}

