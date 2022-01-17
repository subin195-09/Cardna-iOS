//
//  CardPackService.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

import Moya

public class CardPackService {
    static let shared = CardPackService()
    var cardPackProvider = MoyaProvider<CardPackRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func getCardPackAll(id: Int?, completion: @escaping (NetworkResult<Any>) -> Void) {
        cardPackProvider.request(.getCardPackAll(id: id)) { response in
            switch response {
            case.success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeCardPackAllStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getCardPackMe(id: Int?, completion: @escaping (NetworkResult<Any>) -> Void) {
        cardPackProvider.request(.getCardPackMe(id: id)) { response in
            switch response {
            case.success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeCardPackMeStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getCardPackYou(id: Int?, completion: @escaping (NetworkResult<Any>) -> Void) {
        cardPackProvider.request(.getCardPackYou(id: id)) { response in
            switch response {
            case.success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeCardPackYouStatus(by: statusCode, data)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func judgeCardPackAllStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<CardPackAllResponse>.self, from: data)
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
    
    private func judgeCardPackMeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<CardPackMeResponse>.self, from: data)
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
    
    private func judgeCardPackYouStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<CardPackYouResponse>.self, from: data)
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
