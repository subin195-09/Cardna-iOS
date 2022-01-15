//
//  EmailSearchViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/15.
//

import UIKit

class EmailSearchViewController: UIViewController {

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
        setUI()
        hideResult(exist: false)
    }

    // MARK: - Function
    
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
    
    func hideResult(exist: Bool) {
        searchResultView.isHidden = exist
    }
}
