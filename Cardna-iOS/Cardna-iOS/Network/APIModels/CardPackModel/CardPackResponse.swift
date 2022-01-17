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
    let cardYouList: [CardYouList]
}

// MARK: - CardPackMeResponse

struct CardPackMeResponse: Codable {
    let totalCardCnt: Int
    let isMyCard: Bool
    let cardMeList: [CardMeList]
}

// MARK: - CardPackYouResponse

struct CardPackYouResponse: Codable {
    let totalCardCnt: Int
    let isMyCard: Bool
    let cardYouList: [CardYouList]
}

// MARK: - CardMeList

struct CardMeList: Codable {
    let id: Int
    let title: String
    let cardImg: String
    var mainOrder: Int?
    let isLiked: Bool?
    
    mutating func changeMainState() {
        if self.mainOrder == nil {
            self.mainOrder = -1
        }
        else {
            self.mainOrder = nil
        }
    }

}

// MARK: - CardMeList

struct CardYouList: Codable {
    let id: Int
    let title: String
    let cardImg: String
    var mainOrder: Int?
    let isLiked: Bool?
    
    
    mutating func changeMainState() {
        if self.mainOrder == nil {
            self.mainOrder = -1
        }
        else {
            self.mainOrder = nil
        }
    }


}

