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
    
    static let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJqaXdvb0BnbWFpbC5jb20iLCJuYW1lIjoi7KeA7JqwIiwiZmlyZWJhc2VJZCI6ImVpSk9qSHJMTWtVOEpiRTg4TUQxWGp6UWhYRzIiLCJpYXQiOjE2NDIzNDExNzEsImV4cCI6MTY0MjQyNzU3MSwiaXNzIjoiY2FyZG5hIn0.6kSJPB7TwdqDsdPIY0hA9CYtUijq-9VcEfCPtzMjelQ"
}
