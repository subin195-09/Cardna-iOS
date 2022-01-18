//
//  InsightService.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

import Moya

public class InsightService {
    static let shared = InsightService()
    var insightProvider  = MoyaProvider<InsightRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func getInsight(completion: @escaping (NetworkResult<Any>) -> Void) {
        insightProvider.request(.getInsight) { result in
            switch result {
            case .success(let response):
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
        switch statusCode {
        case 200:
            return isValidLoginData(code: statusCode, data: data)
        case 204:
            return isValidLoginData(code: statusCode, data: data)
        case 400..<500:
            return isValidLoginData(code: statusCode, data: data)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidLoginData(code: Int, data: Data) -> NetworkResult<Any> {
        if code == 204 {
            let pass = InsightResponse.init(openAreaCard: nil, blindAreaCard: nil)
            return .success(pass)
        }
        else {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(GeneralResponse<InsightResponse>.self, from: data)
            else { return .pathErr }
            
            return .success(decodedData.data)
        }
        
    }
}
