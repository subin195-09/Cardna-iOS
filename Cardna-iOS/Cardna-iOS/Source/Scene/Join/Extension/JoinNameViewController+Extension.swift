//
//  JoinNameViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/20.
//

import Foundation

extension JoinNameViewController {
    func requestJoin() {
        let email = userEmail
        let password = userPassword
        let name = nameTextField.text ?? ""
        
        print(email, password, name)
        
        JoinService.shared.postJoin(parameter: JoinRequest.init(name: name, email: email, password: password)) { responseData in
            switch responseData {
            case .success(let joinResponse):
                
                guard let response = joinResponse as? GeneralResponse<JoinResponse> else { return }
                if response.status == 404 {
                    self.showToast(message: response.message ?? "", font: .Pretendard(.regular, size: 12))
                }
                else {
                    self.makeAlert(data: response)
                    
                }
            case .requestErr(let message):
                print("requestErr \(message)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
