//
//  AddCardCompletedViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/15.
//

import UIKit

class AddCardCompletedViewController: UIViewController {
    
    // MARK: - Property
    
    var receivedText = ""
    var receivedImage = UIImage()
    
    // MARK: - IBOutlet

    @IBOutlet weak var completedMessage: UILabel!
    @IBOutlet weak var makedCardUIView: UIView!
    @IBOutlet weak var makedCardImageView: UIImageView!
    @IBOutlet weak var makedCardLabel: UILabel!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        self.makedCardLabel.text = receivedText
        self.makedCardImageView.image = receivedImage
    }
    
    // MARK: - Function
    
    private func setUI() {
        setLabel()
        setCardView()
    }
    
    private func setLabel() {
        completedMessage.textColor = .w1
        completedMessage.font = .cardnaH5Sbd
    }
    
    private func setCardView() {
        makedCardUIView.layer.cornerRadius = 10
        makedCardLabel.font = .cardnaH5Sbd
        makedCardLabel.textColor = .black
        makedCardImageView.contentMode = .scaleAspectFill
        makedCardImageView.clipsToBounds = true
    }
}
