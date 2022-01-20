//
//  AddCardService.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/17.
//

import Foundation

import Alamofire

struct AddCardService {
    static let shared = AddCardService()
    
    func postAddCard(title: String,
                     content: String,
                     symbolId: Int?,
                     img: UIImage,
                     completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let parameters: [String: Any] = [
            "title": title,
            "content": content,
            "symbolId": symbolId ?? nil
        ]
        let url = URLConstant.baseURL + URLConstant.card
        let header: HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "Content-Type" : "application/json",
            "token": NetworkConstant.accessToken
        ]
        
        AF.upload(multipartFormData: { (multipart) in
            if let image = img.jpegData(compressionQuality: 1) {
                multipart.append(image, withName: "photo", fileName: "\(title).jpg", mimeType: "image/jpeg")
            }
            for (key, value) in parameters {
                multipart.append("\(value)".data(using: .utf8, allowLossyConversion: false)!, withName: "\(key)")
            }
        },
                  to: url,
                  method: .post,
                  headers: header).responseJSON(completionHandler: { (response) in
            print(response)
            if let err = response.error {
                print(err)
                return
            }
            print("success")
        })
    }
    
    func postAddCardYou(friendId: Int,
                        title: String,
                        content: String,
                        relation: String,
                        symbolId: Int?,
                        img: UIImage,
                        completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let parameters: [String: Any] = [
            "title": title,
            "content": content,
            "relation": relation,
            "symbolId": symbolId ?? nil
        ]
        let url = URLConstant.baseURL + URLConstant.card + "/\(friendId)"
        let header: HTTPHeaders = [
            "Content-Type" : "multipart/form-data",
            "Content-Type" : "application/json",
            "token": NetworkConstant.accessToken
        ]
        
        AF.upload(multipartFormData: { (multipart) in
            if let image = img.jpegData(compressionQuality: 1) {
                multipart.append(image, withName: "photo", fileName: "\(title).jpg", mimeType: "image/jpeg")
            }
            for (key, value) in parameters {
                multipart.append("\(value)".data(using: .utf8, allowLossyConversion: false)!, withName: "\(key)")
            }
        },
                  to: url,
                  method: .post,
                  headers: header).responseJSON(completionHandler: { (response) in
            print(response)
            if let err = response.error {
                print(err)
                return
            }
            print("success")
        })
    }
    
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GeneralResponse<AddCardResponse>.self, from: data)
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
