//
//  MyPageService.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/17.
//

import Foundation

import Moya

public class MyPageService {
    static let shared = MyPageService()
    var myPageProvider = MoyaProvider<MyPageRouter>(plugins: [MoyaLoggingPlugin()])
    
    public init() { }
    
    func getMyPage(completion: @escaping (NetworkResult<Any>) -> Void) {
        myPageProvider.request(.getMyPage) { response in
            print(response)
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
        guard let decodedData = try? decoder.decode(GeneralResponse<MyPageResponse>.self, from: data)
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

