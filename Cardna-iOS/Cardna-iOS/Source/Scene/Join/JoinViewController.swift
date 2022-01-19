//
//  JoinViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/16.
//

import UIKit

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
    @IBOutlet weak var andInExplainLabel: UILabel!
    @IBOutlet weak var privacyLabel: UILabel!
    @IBOutlet weak var serviceProtocolButton: UIButton!
    @IBOutlet weak var privacyButton: UIButton!
    @IBOutlet weak var joinCompleteButton: UIButton!
    @IBOutlet weak var joinCompletedView: UIView!
    @IBOutlet weak var joinCompletedLabel: UILabel!
    
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
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(validateEmail), for: .allEditingEvents)
        emailTextFieldUnderLine.backgroundColor = .w3
        emailInputErrorImageView.isHidden = true
        emailInputErrorLabel.font = .cardnaC
        emailInputErrorLabel.isHidden = true
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호 (영문+숫자 최소 8자 이상)",
                                                                     attributes: [
                                                                        NSAttributedString.Key.font: UIFont.cardnaB1Rg,
                                                                        NSAttributedString.Key.foregroundColor: UIColor.w3])
        passwordTextField.textColor = .w1
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(validatePassword), for: .allEditingEvents)
        showPasswordToggleButton.setImage(Const.Image.icbtEye, for: .normal)
        passwordTextFieldUnderLine.backgroundColor = .w3
        passwordInputErrorImageView.isHidden = true
        passwordInputErrorLabel.font = .cardnaC
        passwordInputErrorLabel.isHidden = true
        explainLabel.font = .cardnaB3Rg
        explainLabel.textColor = .w3
        serviceProtocolLabel.font = .cardnaB3Rg
        serviceProtocolLabel.textColor = .mainGreen
        andInExplainLabel.font = .cardnaB3Rg
        andInExplainLabel.textColor = .w3
        privacyLabel.font = .cardnaB3Rg
        privacyLabel.textColor = .mainGreen
        joinCompleteButton.backgroundColor = .mainGreen
        joinCompleteButton.tintColor = .black
        joinCompleteButton.titleLabel?.font = .cardnaH5Sbd
        joinCompleteButton.layer.cornerRadius = 10
        joinCompleteButton.isEnabled = false
        joinCompletedView.layer.cornerRadius = 10
        joinCompletedView.backgroundColor = .w3
        joinCompletedView.clipsToBounds = true
        joinCompletedLabel.font = .cardnaH6Rg
        joinCompletedLabel.textColor = .w2
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isValidPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-zA-z])(?=.*[0-9]).{8,64}"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPred.evaluate(with: password)
    }
    
    private func setButtonEnable() {
        if (emailTextField.hasText && passwordTextField.hasText && emailInputErrorImageView.isHidden && passwordInputErrorImageView.isHidden) {
            joinCompleteButton.isEnabled = true
            joinCompletedView.setViewGradient(startColor: .mainGreen, endColor: .mainPurple)
            joinCompletedLabel.font = .cardnaH5Sbd
            joinCompletedLabel.textColor = .black
        }
        else {
            joinCompleteButton.isEnabled = false
            joinCompletedView.setViewGradient(startColor: .w3, endColor: .w3)
            joinCompletedView.backgroundColor = .w3
            joinCompletedLabel.font = .cardnaH6Rg
            joinCompletedLabel.textColor = .w2
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showPassword(_ sender: Any) {
        if self.showPasswordToggleButton.image(for: .normal) == Const.Image.icbtEye {
            self.showPasswordToggleButton.setImage(Const.Image.icbtEyeslash, for: .normal)
        } else {
            self.showPasswordToggleButton.setImage(Const.Image.icbtEye, for: .normal)
        }
        self.passwordTextField.isSecureTextEntry.toggle()
    }
    
    @IBAction func touchUpServiceProtocolButton(_ sender: Any) {
        guard let serviceProtocolVC = self.storyboard?.instantiateViewController(withIdentifier: "ServiceProtocolViewController") as? ServiceProtocolViewController else { return }
        self.navigationController?.pushViewController(serviceProtocolVC, animated: true)
    }
    
    @IBAction func touchUpPrivacyButton(_ sender: Any) {
        guard let privacyVC = self.storyboard?.instantiateViewController(withIdentifier: "PrivacyViewController") as? PrivacyViewController else { return }
        self.navigationController?.pushViewController(privacyVC, animated: true)
    }
    
    // MARK: - Objc Function
    
    @objc
    private func validateEmail() {
        guard let text = emailTextField.text else { return }
        if isValidEmail(text) {
            emailInputErrorImageView.isHidden = true
            emailInputErrorLabel.isHidden = true
            emailTextFieldUnderLine.backgroundColor = .w1
        } else {
            emailInputErrorImageView.isHidden = false
            emailInputErrorLabel.isHidden = false
            emailTextFieldUnderLine.backgroundColor = .cardnaAcntRed
        }
    }
    
    @objc
    private func validatePassword() {
        guard let text = passwordTextField.text else { return }
        if isValidPassword(text) {
            passwordInputErrorImageView.isHidden = true
            passwordInputErrorLabel.isHidden = true
            passwordTextFieldUnderLine.backgroundColor = .w1
        } else {
            passwordInputErrorImageView.isHidden = false
            passwordInputErrorLabel.isHidden = false
            passwordTextFieldUnderLine.backgroundColor = .cardnaAcntRed
        }
    }
    
    @objc
    func textFieldDidChange(_ textField : UITextField) {
        setButtonEnable()
        if textField == emailTextField {
            if emailTextField.hasText {
                emailTextFieldUnderLine.backgroundColor = .cardnaAcntRed
            }
            else {
                emailTextFieldUnderLine.backgroundColor = .w4
            }
        }
        else if textField == passwordTextField {
            if passwordTextField.hasText {
                showPasswordToggleButton.isHidden = false
                passwordTextFieldUnderLine.backgroundColor = .cardnaAcntRed
            }
            else {
                showPasswordToggleButton.isHidden = true
                passwordTextFieldUnderLine.backgroundColor = .w4
            }
        }
    }
}
