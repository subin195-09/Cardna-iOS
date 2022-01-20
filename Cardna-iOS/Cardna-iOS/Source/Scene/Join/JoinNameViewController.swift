//
//  JoinNameViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/16.
//

import UIKit

class JoinNameViewController: UIViewController {
    
    // MARK: - Property
    
    var userEmail: String = ""
    var userPassword: String = ""
    
    // MARK: - IBOutlet

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var whatsYourNameLabel: UILabel!
    @IBOutlet weak var nameExplainLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameTextFieldUnderLineUIView: UIView!
    @IBOutlet weak var nameCountLabel: UILabel!
    @IBOutlet weak var nameCompleteButton: UIButton!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    private func setUI() {
        whatsYourNameLabel.font = .cardnaH3Sbd
        whatsYourNameLabel.textColor = .w1
        nameExplainLabel.font = .cardnaB3Rg
        nameExplainLabel.textColor = .w3
        nameTextField.attributedPlaceholder = NSAttributedString(string: "최대 3글자",
                                                                 attributes: [
                                                                   NSAttributedString.Key.font: UIFont.cardnaB1Rg,
                                                                   NSAttributedString.Key.foregroundColor: UIColor.w3])
        nameTextField.backgroundColor = .black
        nameTextField.textColor = .w1
        nameTextField.font = .cardnaB1Rg
        nameTextFieldUnderLineUIView.backgroundColor = .w4
        nameCountLabel.textColor = .w3
        nameCountLabel.font = .cardnaC
        nameCompleteButton.backgroundColor = .w3
        nameCompleteButton.backgroundColor = .mainGreen
        nameCompleteButton.tintColor = .black
        nameCompleteButton.titleLabel?.font = .cardnaH5Sbd
        nameCompleteButton.layer.cornerRadius = 10
    }
    
    func makeAlert(data: GeneralResponse<JoinResponse>) {
        let alert = UIAlertController(title: "회원가입",
                                      message: data.message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - IBAction
    
    @IBAction func touchUpBackButton(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func touchUpNameCompleteButton(_ sender: Any) {
        self.requestJoin()
    }
}
