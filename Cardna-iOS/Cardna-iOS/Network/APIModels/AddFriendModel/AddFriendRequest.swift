//
//  AddFriendRequest.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/18.
//

import Foundation

// MARK: - Welcome
struct AddFriendRequest: Codable {
    let friendID: Int

    enum CodingKeys: String, CodingKey {
        case friendID = "friendId"
    }
}
