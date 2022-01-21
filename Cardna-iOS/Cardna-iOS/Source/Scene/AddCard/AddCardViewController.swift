//
//  AddCardViewController.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/12.
//

import UIKit

import SnapKit
import Then
import MaterialComponents.MaterialBottomSheet

class AddCardViewController: UIViewController {
    
    // MARK: - Property
    
    var cardContentsTextViewPlaceHolder = "더 자세하게 적어볼까요?\n설명, 자랑, 경험 등 어떤 내용도 좋아요 :)"
    var isMe = true
    var cardForName = ""
    var cardYouRelation = ""
    var selectedSymbolId: Int? = nil
    
    // MARK: - Component
    
    var titleBarUIView = UIView()
    
    var backButton = UIButton().then {
        $0.setImage(Const.Image.icbtBack, for: .normal)
        $0.addTarget(self, action: #selector(backButtonDidTap(_:)), for: .touchUpInside)
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
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
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
    
    var cardImageViewButton = UIButton()
    
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
        $0.returnKeyType = .next
        $0.borderStyle = .none
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
        label.text = "0/200"
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
        $0.addTarget(self, action: #selector(showCompletedCard(_:)), for: .touchUpInside)
    }
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setGesture()
        setTouchUpCardImageViewButton()
        setTextFieldDelegate()
        setNotificationCenter()
        setCardYouOption()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        setViewHierarchy()
        setConstraints()
    }
    
    private func setGesture() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(didTapTextView(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setTouchUpCardImageViewButton() {
        cardImageViewButton.addTarget(self, action: #selector(didImageViewTap), for: .touchUpInside)
    }
    
    private func setTextFieldDelegate() {
        cardKeywordTextField.delegate = self
    }
    
    private func setNotificationCenter() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textDidChange(_:)),
                                               name: UITextField.textDidChangeNotification,
                                               object: cardKeywordTextField)
    }
    
    private func setViewHierarchy() {
        view.addSubviews(titleBarUIView, backButton, addCardViewTitleLabel, addCardScrollView)
        self.addCardScrollView.addSubviews(emptyCardImage, emptyCardLabel, cardImageView, cardImageViewButton,
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
            $0.leading.equalTo(self.titleBarUIView.snp.leading).offset(8)
        }
        
        addCardViewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleBarUIView.snp.top).offset(8)
            $0.centerX.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(27)
        }
        
        addCardScrollView.snp.makeConstraints {
            $0.top.equalTo(self.titleBarUIView.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(UIScreen.main.bounds.width)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(4)
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
        
        cardImageViewButton.snp.makeConstraints {
            $0.top.equalTo(self.cardImageView)
            $0.width.equalTo(190)
            $0.height.equalTo(273)
            $0.centerX.equalTo(self.addCardScrollView)
        }
        
        emptyCardLabel.snp.makeConstraints {
            $0.top.equalTo(self.emptyCardImage.snp.bottom).offset(18)
            $0.centerX.equalTo(self.cardImageView)
            $0.height.equalTo(44)
        }
        
        cardContentsUIView.snp.makeConstraints {
            $0.top.equalTo(self.cardImageView.snp.bottom).offset(21)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(200)
        }
        
        cardKeywordLabel1.snp.makeConstraints {
            $0.top.equalTo(self.cardContentsUIView.snp.top)
            $0.leading.equalTo(self.cardContentsUIView.snp.leading)
            $0.height.equalTo(27)
        }
        
        cardKeywordTextField.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordLabel1.snp.bottom).offset(4)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-26)
            $0.height.equalTo(34)
        }
        
        cardKeywordLabel2.snp.makeConstraints {
            $0.leading.equalTo(self.cardKeywordTextField.snp.trailing).offset(4)
            $0.trailing.equalTo(self.cardContentsUIView.snp.trailing)
            $0.centerY.equalTo(self.cardKeywordTextField)
        }
        
        cardKeywordUnderLine.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordTextField.snp.bottom)
            $0.leading.equalTo(self.cardKeywordTextField)
            $0.trailing.equalTo(self.cardKeywordTextField)
            $0.height.equalTo(2)
        }
        
        cardKeywordCountLabel.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordUnderLine.snp.bottom).offset(4)
            $0.trailing.equalTo(self.cardKeywordUnderLine.snp.trailing)
            $0.height.equalTo(18)
        }
        
        cardContentsTextView.snp.makeConstraints {
            $0.top.equalTo(self.cardKeywordCountLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.cardContentsUIView.snp.leading)
            $0.trailing.equalTo(self.cardContentsUIView.snp.trailing)
            $0.height.equalTo(168)
        }
        
        cardContentsCountLabel.snp.makeConstraints {
            $0.top.equalTo(self.cardContentsTextView.snp.bottom).offset(4)
            $0.trailing.equalTo(self.cardContentsUIView.snp.trailing)
            $0.bottom.equalTo(self.cardContentsUIView.snp.bottom)
            $0.height.equalTo(18)
        }
        
        addCardButton.snp.makeConstraints {
            $0.top.equalTo(self.cardContentsUIView.snp.bottom).offset(28)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
            $0.bottom.equalTo(self.addCardScrollView.snp.bottom).inset(4)
            $0.height.equalTo(64)
        }
    }
    
    func updateContentsCountLabel(characterCount: Int) {
        cardContentsCountLabel.text = "\(characterCount)/200"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.cardKeywordTextField {
            self.cardContentsTextView.becomeFirstResponder()
        }
        return true
    }
    
    private func showBottomSheet() {
        guard let bottomSheetVC = UIStoryboard(name: "AddCardBottomSheet", bundle: nil)
                .instantiateViewController(withIdentifier: "AddCardBottomSheetViewController") as? AddCardBottomSheetViewController else { return }
        if (self.isMe) {
            bottomSheetVC.isMe = true
        } else {
            bottomSheetVC.isMe = false
        }
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: bottomSheetVC)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 300
        bottomSheet.adjustHeightForSafeAreaInsets = false
        self.present(bottomSheet, animated: true, completion: nil)
    }
    
    private func setCardYouOption() {
        if (!self.isMe) {
            self.addCardViewTitleLabel.text = "타인 소개 작성"
            self.cardKeywordLabel1.text = "\(cardForName)님은"
            self.addCardButton.setTitle("작성 완료", for: .normal)
            self.addCardButton.backgroundColor = .mainPurple
        }
    }
    
    // MARK: - Objc Function
    
    @objc
    private func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func didImageViewTap(_ sender: Any) {
        showBottomSheet()
    }
    
    @objc
    private func didTapTextView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc
    private func showCompletedCard(_ sender: Any) {
        if (self.isMe) {
            AddCardService.shared.postAddCard(title: cardKeywordTextField.text!,
                                              content: cardContentsTextView.text,
                                              symbolId: selectedSymbolId,
                                              img: cardImageView.image ?? UIImage()) { result in
                switch result {
                case .success(let msg):
                    print("success", msg)
                case .requestErr(let msg):
                    print("requestERR", msg)
                case .pathErr:
                    print("pathERR")
                case .serverErr:
                    print("serverERR")
                case .networkFail:
                    print("networkFail")
                }
            }
            
            guard let completedCardVC = UIStoryboard(name: "AddCardCompletedViewController", bundle: nil)
                    .instantiateViewController(withIdentifier: "AddCardCompletedViewController") as? AddCardCompletedViewController else { return }
            completedCardVC.receivedText = cardKeywordTextField.text ?? ""
            completedCardVC.receivedImage = cardImageView.image ?? UIImage()
            completedCardVC.modalPresentationStyle = .fullScreen
            self.present(completedCardVC, animated: true, completion: nil)
        } else {
            AddCardService.shared.postAddCardYou(friendId: 4,
                                                 title: cardKeywordTextField.text!,
                                                 content: cardContentsTextView.text,
                                                 relation: cardYouRelation,
                                                 symbolId: selectedSymbolId,
                                                 img: cardImageView.image!) { result in
                switch result {
                case .success(let msg):
                    print("successzzzzzz", msg)
                case .requestErr(let msg):
                    print("requestERR", msg)
                case .pathErr:
                    print("pathERR")
                case .serverErr:
                    print("serverERR")
                case .networkFail:
                    print("networkFail")
                }
            }
            
            guard let completedCardVC = UIStoryboard(name: "AddCardYouCompleted", bundle: nil)
                    .instantiateViewController(withIdentifier: "AddCardYouCompleted") as? AddCardYouCompletedViewController else { return }
            completedCardVC.modalPresentationStyle = .fullScreen
            self.present(completedCardVC, animated: true, completion: nil)
        }
    }
    
    @objc
    private func textDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                cardKeywordCountLabel.text = "\(text.count)/14"
                
                if text.count > 14 {
                    let index = text.index(text.startIndex, offsetBy: 14)
                    let newString = text[text.startIndex..<index]
                    textField.text = String(newString)
                }
            }
        }
    }
}
