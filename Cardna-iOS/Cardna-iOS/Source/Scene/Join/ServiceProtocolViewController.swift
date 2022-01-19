//
//  ServiceProtocolViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/20.
//

import UIKit

class ServiceProtocolViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var serviceProtocolTitleLabel: UILabel!
    @IBOutlet weak var serviceProtocolContentsLabel: UILabel!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    private func setUI() {
        serviceProtocolTitleLabel.text = "서비스 이용약관"
        serviceProtocolTitleLabel.textColor = .w1
        serviceProtocolTitleLabel.font = .cardnaSh1Sbd
        serviceProtocolContentsLabel.textColor = .w3
        serviceProtocolContentsLabel.font = .cardnaB3Rg
        serviceProtocolContentsLabel.numberOfLines = 0
    }
    
    // MARK: - IBAction
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
