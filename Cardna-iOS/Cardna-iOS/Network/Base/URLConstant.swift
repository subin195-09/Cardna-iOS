//
//  URLConstant.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/16.
//

import Foundation

struct URLConstant {
    
    // MARK: - base URL
    
    static let baseURL = "https://asia-northeast3-cardna-29f5b.cloudfunctions.net/api"
    
    // MARK: - Auth
    
    static let authSignUpEmail = "/auth/signup/email"
    static let authLoginEmail = "/auth/login/email"
    static let authRefreshToken = "/auth/refreshtoken"
    
    // MARK: - Card
    
    static let cardMain = "/card/main"
    static let card = "/card"
    static let cardMe = "/card/me"
    static let cardYou = "/card/you"
    static let cardInfo = "/card/info"
    static let cardBox = "/card/box"
    static let cardPack = "/card/pack"
    
    // MARK: - Like
    
    static let like = "/like"

    // MARK: - Friend
    
    static let friend = "/friend"
    static let friendList = "/friend/list"
    static let friendSearch = "/friend/search"
    
    // MARK: - Insight
    
    static let insight = "/insight"
    
    // MARK: - MyPage
    static let myPage = "/my-page"
    static let myPageUser = "/my-page/user"
}
