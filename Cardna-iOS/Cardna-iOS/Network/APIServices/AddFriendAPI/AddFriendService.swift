//
//  AddFriendService.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/18.
//

import Foundation

import Moya

public class AddFriendService {
    static let shared = AddFriendService()
    var addFriendProvider = MoyaProvider<AddFriendRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func postAddFriend(parameter: AddFriendRequest, completion: @escaping (NetworkResult<Any>) -> Void) {
        addFriendProvider.request(.postAddFriend(parameter: parameter)) { result in
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
        case 200..<202:
            return isValidLoginData(data: data)
        case 400..<500:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isValidLoginData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<AddFriendResponse>.self, from: data)
        else { return .pathErr }

        return .success(decodedData.data)
    }
}
