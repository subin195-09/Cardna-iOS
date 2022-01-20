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
                if response.status == 404 {
                    self.showToast(message: response.message ?? "", font: .Pretendard(.regular, size: 12))
                }
                else {
                   // guard let data = response.data as? LoginResponse else { return }
                    NetworkConstant.name = response.data?.name ?? ""
                    NetworkConstant.accessToken = response.data?.accessToken ?? ""
                    guard let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainTabBarController") as? MainTabBarController else { return }
                    self.changeRootViewController(homeVC)
                    
                    
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
