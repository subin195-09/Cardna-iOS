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
    
    // MARK: - Property
    
    var cardKeywordCount: Int = 0
    var cardContentsTextViewPlaceHolder = "더 자세하게 적어볼까요?\n설명, 자랑, 경험 등 어떤 내용도 좋아요 :)"
    
    
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
    
    var addCardScrollView = UIScrollView()
    
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
    
    var cardContentsUIView = UIView()
    
    var cardKeywordLabel1 = UILabel().then {
        $0.text = "나는"
        $0.font = .cardnaSh1Sbd
        $0.textColor = .w1
    }
    
    var cardKeywordTextField = UITextField().then {
        $0.attributedPlaceholder = NSAttributedString(string: "키워드 중심으로 표현해보세요",
                                                      attributes: [
                                                        NSAttributedString.Key.font: UIFont.cardnaB1Rg,
                                                        NSAttributedString.Key.foregroundColor: UIColor.w3])
        $0.font = .cardnaSh3Sbd
        $0.textColor = .w1
    }
    
    var cardKeywordLabel2 = UILabel().then {
        $0.text = "!"
        $0.font = .cardnaSh1Sbd
        $0.textColor = .w1
    }
    
    var cardKeywordUnderLine = UIView().then {
        $0.backgroundColor = .w2
    }
    
    var cardKeywordCountLabel = UILabel().then {
        $0.text = "0/14"
        $0.font = .cardnaC
        $0.textColor = .w3
        $0.textAlignment = .right
    }
    
    lazy var cardContentsTextView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .black
        view.text = cardContentsTextViewPlaceHolder
        view.font = .cardnaB1Rg
        view.textColor = .w3
        view.delegate = self
        
        return view
    }()
    
    lazy var cardContentsCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0/700"
        label.font = .cardnaC
        label.textColor = .w3
        
        return label
    }()
    
    var addCardButton = UIButton().then {
        $0.setTitle("카드나 만들기", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .cardnaH5Sbd
        $0.backgroundColor = .mainGreen
        $0.layer.cornerRadius = 10
    }
    
    // MARK: - VC LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setGesture()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        view.addSubviews(titleBarUIView, backButton, addCardViewTitleLabel, addCardScrollView)
        self.addCardScrollView.addSubviews(cardImageView, emptyCardImage, emptyCardLabel,
                                           cardContentsUIView, cardKeywordLabel1,
                                           cardKeywordTextField, cardKeywordLabel2,
                                           cardKeywordUnderLine, cardKeywordCountLabel,
                                           cardContentsTextView, cardContentsCountLabel,
                                           addCardButton)
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
        
        addCardScrollView.snp.makeConstraints {
            $0.top.equalTo(self.titleBarUIView.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-4)
        }
        
        cardImageView.snp.makeConstraints {
            $0.top.equalTo(self.addCardScrollView.snp.top).inset(20)
            $0.width.equalTo(190)
            $0.height.equalTo(273)
            $0.centerX.equalTo(self.addCardScrollView)
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
        
        cardContentsUIView.snp.makeConstraints {
            $0.top.equalTo(self.cardImageView.snp.bottom).offset(21)
            $0.leading.equalTo(self.addCardScrollView.snp.leading).offset(16)
            $0.trailing.equalTo(self.addCardScrollView.snp.trailing).offset(-16)
        }
        
        cardKeywordLabel1.snp.makeConstraints {
            $0.top.equalTo(self.cardContentsUIView.snp.top)
            $0.leading.equalTo(self.cardContentsUIView.snp.leading)
            $0.height.equalTo(27)
        }
        
        cardKeywordTextField.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordLabel1.snp.bottom).offset(4)
            $0.leading.equalTo(self.addCardScrollView.snp.leading).offset(16)
            $0.width.equalTo(333)
            $0.height.equalTo(28)
        }
        
        cardKeywordLabel2.snp.makeConstraints {
            $0.leading.equalTo(self.cardKeywordTextField.snp.trailing).offset(4)
            $0.trailing.equalTo(self.cardContentsUIView.snp.trailing)
            $0.centerY.equalTo(self.cardKeywordTextField)
        }
        
        cardKeywordUnderLine.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordTextField.snp.bottom).offset(4)
            $0.leading.equalTo(self.cardKeywordTextField)
            $0.width.equalTo(333)
            $0.height.equalTo(2)
        }
        
        cardKeywordCountLabel.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordUnderLine.snp.bottom).offset(4)
            $0.trailing.equalTo(self.addCardScrollView.snp.trailing).inset(26)
            $0.height.equalTo(18)
        }
        
        cardContentsTextView.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordCountLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.addCardScrollView.snp.leading).offset(16)
            $0.trailing.equalTo(self.addCardScrollView.snp.trailing).offset(-16)
            $0.height.equalTo(168)
        }
        
        cardContentsCountLabel.snp.makeConstraints {
            $0.top.equalTo(self.cardContentsTextView.snp.bottom).offset(4)
            $0.trailing.equalTo(self.addCardScrollView.snp.trailing).inset(16)
            $0.bottom.equalTo(self.cardContentsUIView.snp.bottom)
            $0.height.equalTo(18)
        }
        
        addCardButton.snp.makeConstraints {
            $0.top.equalTo(self.cardContentsUIView.snp.bottom).offset(28)
            $0.leading.equalTo(self.addCardScrollView.snp.leading).inset(16)
            $0.trailing.equalTo(self.addCardScrollView.snp.trailing).inset(16)
            $0.bottom.equalTo(self.addCardScrollView.snp.bottom).inset(4)
            $0.height.equalTo(64)
        }
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(didTapTextView(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    func updateContentsCountLabel(characterCount: Int) {
        cardContentsCountLabel.text = "\(characterCount)/200"
    }
    
    // MARK: - Objc Function
    
    @objc
    private func didTapTextView(_ sender: Any) {
        view.endEditing(true)
    }
}
