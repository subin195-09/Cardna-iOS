//
//  JoinService.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/20.
//

import Foundation

import Moya

public class JoinService {
    static let shared = JoinService()
    var joinProvider = MoyaProvider<JoinRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func postJoin(parameter: JoinRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        joinProvider.request(.postJoin(parameter: parameter)) { result in
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
        case 200..<208:
            return isValidJoinData(data: data)
        case 400..<500:
            return isValidJoinData(data: data)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isValidJoinData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<JoinResponse>.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData)
    }
}
