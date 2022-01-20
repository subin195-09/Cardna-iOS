//
//  NetworkConstant.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/16.
//

import Foundation

struct NetworkConstant {
    
    static let noTokenHeader = ["Content-Type": "application/json"]
    static let hasTokenHeader = ["Content-Type": "application/json",
                                 "token": NetworkConstant.accessToken]
    
    static var accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJqaXdvb0BnbWFpbC5jb20iLCJuYW1lIjoi7KeA7JqwIiwiZmlyZWJhc2VJZCI6ImVpSk9qSHJMTWtVOEpiRTg4TUQxWGp6UWhYRzIiLCJpYXQiOjE2NDI0MjgwNTEsImV4cCI6MTY0NTAyMDA1MSwiaXNzIjoiY2FyZG5hIn0.Z3OX9oKBXZ9vFA84KT1L4LcwFeweUF3cgDnwqQotpVI"
    
    static var name = ""

}
