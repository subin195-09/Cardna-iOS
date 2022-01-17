//
//  AddCardYouCompletedViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/18.
//

import UIKit

import Lottie

class AddCardYouCompletedViewController: UIViewController {
    
    // MARK: - Property
    
    
    
    // MARK: - IBOutlet

    @IBOutlet weak var addCardYouConpletedLabel: UILabel!
    lazy var completedLottieView: AnimationView = {
        let animationView = AnimationView(name: "gif_confetti")
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setConpletedLottieView()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        addCardYouConpletedLabel.text = "타인의 소개를 작성했어요!"
        addCardYouConpletedLabel.font = .cardnaH5Sbd
    }
    
    private func setConpletedLottieView() {
        view.addSubviews(completedLottieView)
        completedLottieView.isHidden = false
        completedLottieView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6){
            self.completedLottieView.isHidden = true
            self.completedLottieView.stop()
            self.dismiss(animated: true, completion: nil)
        }
    }
}
