//
//  LikeService.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/20.
//

import Foundation

import Moya

public class LikeService {
    static let shared = LikeService()
    var likeProvider = MoyaProvider<LikeRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func postLike(cardId: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        likeProvider.request(.postLike(cardID: cardId)) { response in
            switch response {
            case.success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<LikeResponse>.self, from: data)
        else { return .pathErr }
        print(decodedData)
        switch statusCode {
        case 200:
            return .success(decodedData.data)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
}
