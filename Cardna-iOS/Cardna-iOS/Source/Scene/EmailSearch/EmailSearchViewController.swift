//
//  EmailSearchViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/15.
//

import UIKit

class EmailSearchViewController: UIViewController {
    
    // MARK: - Property
    
    var friendExist: Bool = false
    var nowFriend: Bool = false 

    // MARK: - IBOutlet
    
    @IBOutlet weak var searchFieldView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchResultView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitializeState()
        setUI()
        hideResult()
    }

    // MARK: - Function
    
    func setInitializeState() {
        friendExist = false
        searchTextField.delegate = self
    }
    
    func setUI() {
        setViewUI()
        setImageViewUI()
        setTextFieldUI()
        setLabelUI()
    }
    
    func setViewUI() {
        searchFieldView.backgroundColor = .w4
        searchFieldView.layer.cornerRadius = 10
        searchResultView.backgroundColor = .darkGray
        searchResultView.layer.cornerRadius = 10
    }
    
    func setImageViewUI() {
        profileImageView.layer.cornerRadius = 32
        profileImageView.clipsToBounds = true
    }
    
    func setTextFieldUI() {
        searchTextField.font = .Pretendard(.regular, size: 16)
        searchTextField.textColor = .w1
        searchTextField.setPlaceholderColor(.w2)
    }
    
    func setLabelUI() {
        nameLabel.font = .cardnaB2Sbd
        nameLabel.textColor = .w1
        emailLabel.font = .cardnaB3Rg
        emailLabel.textColor = .w2
    }
    
    func hideResult() {
        searchResultView.isHidden = !friendExist
    }
    
    func setFriendResult(data: EmailSearchResponse) {
        profileImageView.setImage(with: data.userImg)
        nameLabel.text = data.name
        emailLabel.text = data.email
        if data.isFriend {
            addButton.isEnabled = false
        }
        else {
            addButton.isEnabled = true
        }
    }
}
