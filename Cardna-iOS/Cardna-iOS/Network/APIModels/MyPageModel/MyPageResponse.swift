//
//  MyPageResponse.swift
//  Cardna-iOS
//
//  Created by κΉνμ on 2022/01/17.
//

import Foundation

// MARK: - MyPageResponse

struct MyPageResponse: Codable {
    let id: Int
    let name: String
    let userImg: String
    let email: String
    let friendList: [FriendList]
}

// MARK: - FriendList

struct FriendList: Codable {
    let id: Int
    let name: String
    let userImg: String
    let sentence: String?
}
