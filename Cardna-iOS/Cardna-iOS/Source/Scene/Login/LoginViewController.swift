//
//  LoginViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/16.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailUnderView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var passwordUnderView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var okView: UIView!
    @IBOutlet weak var okLabel: UILabel!
    @IBOutlet weak var findPasswordButton: UIButton!
    @IBOutlet weak var findPasswordLabel: UILabel!
    @IBOutlet weak var emailUnderViewHeight: NSLayoutConstraint!
    @IBOutlet weak var passwordUnderViewHeight: NSLayoutConstraint!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialState()
        setUI()
    }
    
    // MARK: - Function
    
    private func setInitialState() {
        okButton.isEnabled = false
        passwordTextField.isSecureTextEntry = true
        showPasswordButton.isHidden = true
        showPasswordButton.isSelected = false
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setUI() {
        setTextField()
        setLabelUI()
        setViewUI()
        setButtonUI()
    }
    
    private func setTextField() {
        [emailTextField, passwordTextField].forEach {
            $0?.setPlaceholderColor(.w3)
            $0?.font = .Pretendard(.regular, size: 16)
            $0?.textColor = .w1
        }
    }
    
    private func setLabelUI() {
        titleLabel.font = .cardnaSh1Sbd
        titleLabel.textColor = .w1
        findPasswordLabel.font = .cardnaB3Rg
        findPasswordLabel.textColor = .w3
        okLabel.font = .cardnaH6Rg
        okLabel.textColor = .w2
    }
    
    private func setViewUI() {
        okView.layer.cornerRadius = 10
        okView.backgroundColor = .w3
        okView.clipsToBounds = true
        emailUnderView.backgroundColor = .w4
        passwordUnderView.backgroundColor = .w4
    }
    
    private func setButtonUI() {
        showPasswordButton.setImage(Const.Image.icbtEye, for: .normal)
        showPasswordButton.setImage(Const.Image.icbtEyeslash, for: .selected)
    }
    
    func makeAlert(data: GeneralResponse<LoginResponse>) {
        let alert = UIAlertController(title: "로그인",
                                      message: data.message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func setButtonEnable() {
        if emailTextField.hasText && passwordTextField.hasText {
            okButton.isEnabled = true
            okView.setViewGradient(startColor: .mainGreen, endColor: .mainPurple)
            okLabel.font = .cardnaH5Sbd
            okLabel.textColor = .black
        }
        else {
            okButton.isEnabled = false
            okView.setViewGradient(startColor: .w3, endColor: .w3)
            okView.backgroundColor = .w3
            okLabel.font = .cardnaH6Rg
            okLabel.textColor = .w2
        }
    }
    
    // MARK: - objc function
    
    @objc
    func textFieldDidChange(_ textField : UITextField) {
        setButtonEnable()
        if textField == emailTextField {
            if emailTextField.hasText {
                emailUnderView.backgroundColor = .w1
                emailUnderViewHeight.constant = 2
            }
            else {
                emailUnderView.backgroundColor = .w4
                emailUnderViewHeight.constant = 1
            }
        }
        else if textField == passwordTextField {
            if passwordTextField.hasText {
                showPasswordButton.isHidden = false
                passwordUnderView.backgroundColor = .w1
                passwordUnderViewHeight.constant = 2
            }
            else {
                showPasswordButton.isHidden = true
                passwordUnderView.backgroundColor = .w4
                passwordUnderViewHeight.constant = 1
            }
        }
    }
    
    func makeAlert() {
         let alert = UIAlertController(title: "앗!",
                                       message: "⭐️준비중인 기능이예요⭐️",
                                       preferredStyle: .alert)
         let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
         alert.addAction(okAction)
         self.present(alert, animated: true, completion: nil)
     }
    
    // MARK: - IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func okButtonDidTap(_ sender: Any) {
        self.requestLogin()
    }
    
    @IBAction func showPasswordButtonDidTap(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        showPasswordButton.isSelected = !showPasswordButton.isSelected
    }
    
    @IBAction func findPasswordButtonDidTap(_ sender: Any) {
        makeAlert()
    }
}
