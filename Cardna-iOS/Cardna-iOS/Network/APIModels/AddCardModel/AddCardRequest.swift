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
