//
//  PrivacyViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/20.
//

import UIKit

class PrivacyViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var privacyTitleLabel: UILabel!
    @IBOutlet weak var privacyContentsLabel: UILabel!
    
    // MARK: - VC LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    func setUI() {
        privacyTitleLabel.text = "개인정보 처리 방침"
        privacyTitleLabel.textColor = .w1
        privacyTitleLabel.font = .cardnaSh1Sbd
        privacyContentsLabel.textColor = .w3
        privacyContentsLabel.font = .cardnaB3Rg
        privacyContentsLabel.numberOfLines = 0
    }
    
    // MARK: - IBAction
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
