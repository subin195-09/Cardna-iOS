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
    @IBOutlet weak var okLabel: UILabel!
    @IBOutlet weak var findPasswordButton: UIButton!
    @IBOutlet weak var findPasswordLabel: UILabel!
    
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
        showPasswordButton.isEnabled = false
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
        okLabel.font = .cardnaH6Rg
        okLabel.textColor = .w2
        findPasswordLabel.font = .cardnaB3Rg
        findPasswordLabel.textColor = .w3
    }
    
    private func setViewUI() {
        emailUnderView.backgroundColor = .w4
        passwordUnderView.backgroundColor = .w4
    }
    
    private func setButtonUI() {
        showPasswordButton.setBackgroundImage(Const.Image.icbtBox, for: .normal)
        okButton.backgroundColor = .w3
        okButton.layer.cornerRadius = 10
        okButton.setBackgroundImage(Const.Image.gradientbg, for: .normal)
    }
}
