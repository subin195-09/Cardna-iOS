//
//  CardDetailService.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

import Moya

public class CardDetailService {
    static let shared = CardDetailService()
    var cardDetailProvider = MoyaProvider<CardDetailRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func getCardDetail(cardID: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        cardDetailProvider.request(.getCardDetail(cardID: cardID)) { response in
            //print(response)
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
        guard let decodedData = try? decoder.decode(GeneralResponse<CardDetailResponse>.self, from: data)
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
