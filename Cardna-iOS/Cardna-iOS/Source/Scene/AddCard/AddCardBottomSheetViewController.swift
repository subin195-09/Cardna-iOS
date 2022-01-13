//
//  AddCardBottomSheetViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/13.
//

import UIKit

class AddCardBottomSheetViewController: UIViewController {

    @IBOutlet weak var addCardBottomSheetView: UIView!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var symbolTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    private func setLayout() {
        setBottomSheetViewUI()
        setButtonUI()
        setLabelUI()
    }
    
    private func setButtonUI() {
        completeButton.titleLabel?.font = .cardnaSh3Sbd
        completeButton.tintColor = .w1
    }
    
    private func setLabelUI() {
        symbolTitleLabel.font = .cardnaB4Sbd
        symbolTitleLabel.textColor = .w3
    }
    
    private func setBottomSheetViewUI() {
        addCardBottomSheetView.layer.cornerRadius = 24
        addCardBottomSheetView.backgroundColor = UIColor.darkGray
    }
}
