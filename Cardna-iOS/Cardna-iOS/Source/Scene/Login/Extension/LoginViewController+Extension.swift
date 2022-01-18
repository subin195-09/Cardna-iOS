//
//  LoginViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/17.
//

import Foundation
import UIKit
import SwiftUI

extension LoginViewController {
    func requestLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        LoginService.shared.postLogin(parameter: LoginRequest.init(email: email, password: password)) { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? GeneralResponse<LoginResponse> else { return }
                self.makeAlert(data: response)
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
