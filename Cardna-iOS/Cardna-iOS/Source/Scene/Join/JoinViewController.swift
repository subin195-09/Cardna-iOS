//
//  JoinViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/16.
//

import UIKit
import CoreData

class JoinViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var joinTitleUIView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var joinTitleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailTextFieldUnderLine: UIView!
    @IBOutlet weak var emailInputErrorImageView: UIImageView!
    @IBOutlet weak var emailInputErrorLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordToggleButton: UIButton!
    @IBOutlet weak var passwordTextFieldUnderLine: UIView!
    @IBOutlet weak var passwordInputErrorImageView: UIImageView!
    @IBOutlet weak var passwordInputErrorLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var serviceProtocolLabel: UILabel!
    @IBOutlet weak var AndInExplainLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var serviceProtocolButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var joinCompleteButton: UIButton!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    private func setUI() {
        joinTitleLabel.text = "가입하기"
        joinTitleLabel.font = .cardnaSh1Sbd
        joinTitleLabel.textColor = .w1
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일",
                                                        attributes: [
                                                          NSAttributedString.Key.font: UIFont.cardnaB1Rg,
                                                          NSAttributedString.Key.foregroundColor: UIColor.w3])
        emailTextField.textColor = .w1
        emailTextFieldUnderLine.backgroundColor = .w3
        emailInputErrorLabel.font = .cardnaC
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호 (영문+숫자 최소 8자 이상)",
                                                                     attributes: [
                                                                        NSAttributedString.Key.font: UIFont.cardnaB1Rg,
                                                                        NSAttributedString.Key.foregroundColor: UIColor.w3])
        passwordTextField.textColor = .w1
//        setShowPasswordButtonUI()
        passwordTextFieldUnderLine.backgroundColor = .w3
        passwordInputErrorLabel.font = .cardnaC
        explainLabel.font = .cardnaB3Rg
        explainLabel.textColor = .w3
        serviceProtocolLabel.font = .cardnaB3Rg
        serviceProtocolLabel.textColor = .mainGreen
        AndInExplainLabel.font = .cardnaB3Rg
        AndInExplainLabel.textColor = .w3
        privacyLabel.font = .cardnaB3Rg
        privacyLabel.textColor = .mainGreen
        joinCompleteButton.backgroundColor = .mainGreen
        joinCompleteButton.tintColor = .black
        joinCompleteButton.titleLabel?.font = .cardnaH5Sbd
        joinCompleteButton.layer.cornerRadius = 10
    }
    
    private func setShowPasswordButtonUI() {
        var config = UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets.init(top: 20, leading: 12, bottom: 12, trailing: 20)
        
        showPasswordToggleButton.configuration = config
    }
    
    // MARK: - Function
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    // MARK: - Objc Function
    
    @objc
    private func validateEmail() {
        guard let text = emailTextField.text else { return }
        if isValidEmail(text) {
            // no error message
        } else {
            // error message
        }
    }
}
