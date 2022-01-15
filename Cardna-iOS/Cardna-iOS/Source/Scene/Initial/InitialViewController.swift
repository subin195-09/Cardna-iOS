//
//  InitialViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/15.
//

import UIKit

class InitialViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var joinButton: UIButton!
    
    // MARK: - VC Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Function
    
    private func setUI() {
        setLabelUI()
    }
    
    private func setLabelUI() {
        titleLabel.font = .cardnaB3Rg
        titleLabel.textColor = .w2
    }
}
