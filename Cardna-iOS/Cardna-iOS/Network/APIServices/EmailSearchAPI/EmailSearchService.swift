//
//  EmailSearchService.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation

import Moya

public class EmailSearchService {
    static let shared = EmailSearchService()
    var emailSearchProvider = MoyaProvider<EmailSearchRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func getFriendbyEmailSearch(email: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        emailSearchProvider.request(.getFriendbyEmailSearch(email: email)) { result in
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
            return isValidLoginData(data: data)
        case 400..<500:
            return .requestErr(data)
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(GeneralResponse<EmailSearchResponse>.self, from: data)
            else { return .pathErr }
            
        return .success(decodedData.data)
    }
}
