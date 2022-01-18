//
//  AddCardYouViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/18.
//

import UIKit

class AddCardYouViewController: UIViewController {
    
    // MARK: - Property
    
    static let identifier = "AddCardYouViewController"
    var name = "정재"
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var addCardYouTitleLabel: UILabel!
    @IBOutlet weak var addCardYouQuestion: UILabel!
    @IBOutlet weak var addCardYouTextField: UITextField!
    @IBOutlet weak var addCardYouTextFieldUnderLineView: UIView!
    @IBOutlet weak var addCardYouTextCountLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        self.view.backgroundColor = .black
        
        addCardYouTitleLabel.font = .cardnaSh1Sbd
        addCardYouTitleLabel.textColor = .w1
        addCardYouQuestion.font = .cardnaSh1Sbd
        addCardYouQuestion.textColor = .w1
        addCardYouQuestion.text = "당신은 \(name)님에게 어떤 사람인가요?"
        addCardYouTextField.backgroundColor = .black
        addCardYouTextField.font = .cardnaSh3Sbd
        addCardYouTextField.textColor = .w1
        addCardYouTextField.attributedPlaceholder = NSAttributedString(string: "관계를 자유롭게 표현해주세요!",
                                                        attributes: [
                                                          NSAttributedString.Key.font: UIFont.cardnaB1Rg,
                                                          NSAttributedString.Key.foregroundColor: UIColor.w3])
        addCardYouTextFieldUnderLineView.backgroundColor = .w2
        addCardYouTextCountLabel.font = .cardnaC
        addCardYouTextCountLabel.textColor = .w3
        addCardYouTextCountLabel.text = "0/10"
        nextButton.backgroundColor = .mainPurple
        nextButton.tintColor = .black
        nextButton.titleLabel?.font = .cardnaH5Sbd
        nextButton.layer.cornerRadius = 10
    }
    
    // MARK: - IBAction

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let nextVC = AddCardViewController()
        nextVC.cardYouRelation = self.addCardYouTextField.text ?? ""
        nextVC.isMe = false
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.cardForName = name
        self.present(nextVC, animated: true, completion: nil)
    }
}
