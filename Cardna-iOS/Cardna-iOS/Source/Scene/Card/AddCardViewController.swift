//
//  AddCardViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/12.
//

import UIKit

import SnapKit
import Then

class AddCardViewController: UIViewController {
    
    // MARK: - Component
    
    var titleBarUIView = UIView()
    
    var backButton = UIButton().then {
        $0.setImage(Const.Image.icbtBack, for: .normal)
        //$0.addTarget(self, action: #selector(backButtonDidTap(_:)), for: .touchUpInside)
    }
    
    var addCardViewTitleLabel = UILabel().then {
        $0.text = "카드나 작성"
        $0.font = UIFont.cardnaSh1Sbd
        $0.textColor = UIColor.w1
        $0.textAlignment = .center
    }
    
    var cardImageView = UIImageView().then {
        $0.layer.cornerRadius = 10
        $0.layer.borderColor = UIColor.w3.cgColor
        $0.layer.borderWidth = 1.0
    }
    
    var emptyCardImage = UIImageView().then {
        $0.image = Const.Image.imgCardimg
    }
    
    var emptyCardLabel = UILabel().then {
        $0.text = "카드에 들어갈\n이미지를 넣어보세요!"
        $0.font = .cardnaB1Rg
        $0.textColor = .w3
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    
    // MARK: - VC LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(titleBarUIView, backButton, addCardViewTitleLabel, cardImageView, emptyCardImage, emptyCardLabel)
    }
    
    private func setConstraints() {
        self.view.backgroundColor = .black
        
        titleBarUIView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.height.equalTo(44)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(self.titleBarUIView.snp.top).offset(1)
            $0.leading.equalTo(self.titleBarUIView.snp.leading).offset(16)
        }
        
        addCardViewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleBarUIView.snp.top).offset(8)
            $0.leading.equalTo(self.backButton.snp.trailing).offset(88)
            $0.height.equalTo(27)
        }
        
        cardImageView.snp.makeConstraints {
            $0.top.equalTo(self.titleBarUIView.snp.bottom).offset(20)
            $0.width.equalTo(190)
            $0.height.equalTo(273)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
        }
        
        emptyCardImage.snp.makeConstraints {
            $0.top.equalTo(self.cardImageView.snp.top).inset(83)
            $0.centerX.equalTo(self.cardImageView)
            $0.height.equalTo(40)
        }
        
        emptyCardLabel.snp.makeConstraints {
            $0.top.equalTo(self.emptyCardImage.snp.bottom).offset(18)
            $0.centerX.equalTo(self.cardImageView)
            $0.height.equalTo(44)
        }
    }

    // MARK: 화면 전환 코드
    
    // MARK: - Objc Function
    
//    @objc
//    private func backButtonDidTap(_ sender: UIButton) {
//        let nowVC = self.presentingViewController
//        self.dismiss(animated: true){
//            guard let mainVC = nowVC as? UINavigationController else { return }
//            mainVC.popToRootViewController(animated: true)
//        }
//    }

}
