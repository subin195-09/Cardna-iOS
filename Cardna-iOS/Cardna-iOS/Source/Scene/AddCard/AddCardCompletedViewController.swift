//
//  AddCardCompletedViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/15.
//

import UIKit

import Lottie

class AddCardCompletedViewController: UIViewController {
    
    // MARK: - Property
    
    var receivedText = ""
    var receivedImage = UIImage()
    lazy var completedLottieView: AnimationView = {
        let animationView = AnimationView(name: "gif_confetti")
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
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
        setConpletedLottieView()
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
    
    private func setConpletedLottieView() {
        view.addSubviews(completedLottieView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.completedLottieView.isHidden = false
            self.completedLottieView.play()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.completedLottieView.isHidden = true
            self.completedLottieView.stop()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
