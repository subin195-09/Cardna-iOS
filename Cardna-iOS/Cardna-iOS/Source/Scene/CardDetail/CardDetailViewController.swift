//
//  CardDetailViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/12.
//

import UIKit

import Lottie

class CardDetailViewController: UIViewController {
    
    // MARK: - Property
    /// 분기처리 0: 카드나 1:카드너 2:카드아닌박스
    var cardDetailWhere: Int = 0
    var isFriendsCardDetail: Bool = false
    var cardID: Int?
    var cardData: CardDetailResponse?
    
    lazy var lottieViewCardme : AnimationView = {
        let animationView = AnimationView(name: "lottie_cardme")
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: imageContainerViewHeightConstraint.constant/2)
        animationView.contentMode = .scaleAspectFill
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    lazy var lottieViewCardyou : AnimationView = {
        let animationView = AnimationView(name: "lottie_cardyou")
        animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        animationView.center = CGPoint(x: UIScreen.main.bounds.width/2, y: imageContainerViewHeightConstraint.constant/2)
        animationView.contentMode = .scaleAspectFill
        animationView.stop()
        animationView.isHidden = true
        return animationView
    }()
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var lottieBgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addCardYouButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleBgView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareButtonView: UIView!
    @IBOutlet weak var menuButtonView: UIView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var imageContainerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLottie()
        getCardDetail()
        setUI()
        setDummy()
    }
    
    // MARK: - Function
    
    func setLottie() {
        lottieBgView.addSubview(lottieViewCardme)
        lottieBgView.addSubview(lottieViewCardyou)
    }
    
    func startLottie(lottie: AnimationView) {
        lottieBgView.isHidden = false
        lottie.isHidden = false
        lottie.play()
    }
    
    func stopLottie(lottie: AnimationView) {
        lottieBgView.isHidden = true
        lottie.isHidden = true
        lottie.stop()
    }
    
    func setUI() {
        setLabelUI()
        setAddCardYouButtonUI()
        setUIByWhere(card: cardDetailWhere)
        setLayout()
    }
    
    func setLayout() {
        imageContainerViewHeightConstraint.constant = UIScreen.main.bounds.height * (420/812)
    }
    
    func setUIByWhere(card: Int) {
        /// 색상 분기처리 (나중에 enum으로 바꿀예정)
        switch cardDetailWhere {
        case 0:
            titleBgView.backgroundColor = .mainGreen
            backButton.setImage(Const.Image.icbtBoxbackGreen, for: .normal)
            contentLabelTopConstraint.constant = -12
            fromLabel.isHidden = true
            setMenuButtonInCardMe()
        case 1:
            titleBgView.backgroundColor = .mainPurple
            backButton.setImage(Const.Image.icbtBoxbackPurple, for: .normal)
            setMenuButtonInCardYou()
        case 2:
            titleBgView.backgroundColor = .cardDetailGray
            backButton.setImage(Const.Image.icbtBoxbackGray, for: .normal)
            addCardYouButton.isHidden = false
            setMenuButtonInCardBox()
        default:
            print("default")
        }
    }
    
    func setMenuButtonInCardMe() {
        if isFriendsCardDetail {
            shareButton.isHidden = true
            menuButton.isHidden = true
            shareButtonView.isHidden = true
            menuButtonView.isHidden = true
            likeButton.isHidden = false
        }
        else {
            menuButton.setImage(Const.Image.icbtTrash, for: .normal)
            menuButton.addTarget(self, action: #selector(trashCard), for: .touchUpInside)
        }
    }
    
    func setMenuButtonInCardYou() {
        if isFriendsCardDetail {
            shareButton.isHidden = true
            menuButton.isHidden = true
            shareButtonView.isHidden = true
            menuButtonView.isHidden = true
            likeButton.isHidden = false
        }
        else {
            let inBox = UIAction(title: "보관") { action in
                self.showToast(message: "준비중인 기능입니다", font: .cardnaB3Rg)
                //self.putCardInBox()
            }
            let delete = UIAction(title: "삭제") { action in
                print("삭제")
                self.showToast(message: "준비중인 기능입니다.", font: .cardnaB3Rg)
                //self.deleteCard()
            }
            menuButton.menu = UIMenu(title: "", children: [delete, inBox])
        }
    }
    
    func setMenuButtonInCardBox() {
        shareButton.isHidden = true
        shareButtonView.isHidden = true
        let report = UIAction(title: "신고") { action in
            print("신고")
        }
        let delete = UIAction(title: "삭제") { action in
            print("삭제")
            
            self.deleteCard()
        }
        menuButton.menu = UIMenu(title: "", children: [delete, report])
    }
    
    func setLabelUI() {
        titleLabel.font = .cardnaSh1Sbd
        fromLabel.font = .cardnaB1Rg
        contentLabel.font = .cardnaB1Rg
        dateLabel.font = .cardnaB1Rg
        titleLabel.textColor = UIColor.init(red: 18/255.0, green: 18/255.0, blue: 18/255.0, alpha: 1.0)
        fromLabel.textColor = .w2
        contentLabel.textColor = .w1
        dateLabel.textColor = .w3
        contentLabel.attributedText = contentLabel.text?.textSpacing(lineSpacing: 3)
    }
    
    func setAddCardYouButtonUI() {
        addCardYouButton.tintColor = .black
        addCardYouButton.layer.cornerRadius = 10
    }
    
    func sendMainCardID(cardID: Int) {
        self.cardID = cardID
    }
    
    
    func setData() {
        titleLabel.text = cardData?.title
        imageView.setImage(with: cardData?.cardImg ?? "")
        contentLabel.text = cardData?.content
        dateLabel.text = cardData?.createdAt
        fromLabel.text = "From. \(cardData?.relation ?? "" ) · \(cardData?.name ?? "" )"
        if let like = cardData?.isLiked {
            if like {
                likeButton.setImage(Const.Image.likeSelected, for: .normal)
            }
            else {
                likeButton.setImage(Const.Image.likeUnselected, for: .normal)
            }
        }
    }
    
    func getCardDetail() {
        CardDetailService.shared.getCardDetail(cardID: self.cardID ?? 17) { response in
            switch response {
            case .success(let data):
                guard let data = data as? CardDetailResponse else { return }
                self.cardData = data
                self.setData()
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func putCardInBox() {
        CardPackService.shared.putCardORNot(cardID: cardID ?? 0) { result in
            switch result {
            case .success(_):
                self.navigationController?.popViewController(animated: true)
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("requestErr")
            case .serverErr:
                print("requestErr")
            case .networkFail:
                print("requestErr")
            }
        }
    }
    
    func deleteCard() {
        makeRequestAlert(title: "삭제", message: "카드를 삭제하시겠습니까?", okAction: { _ in
            CardPackService.shared.deleteCard(cardID: self.cardID ?? 0) { result in
                switch result {
                case .success(_):
                    print("카드삭제완료")
                    self.navigationController?.popViewController(animated: true)
                case .requestErr(_):
                    print("requestErr")
                case .pathErr:
                    print("requestErr")
                case .serverErr:
                    print("requestErr")
                case .networkFail:
                    print("requestErr")
                }
            }
        }, cancelAction: { _ in
            print("취소") },
                         completion: nil)
    }
    
    func likeCard() {
        
        LikeService.shared.postLike(cardId: cardID ?? 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                print(data)
                guard let data = data as? LikeResponse else { return }
                if data.isLiked {
                    self.likeButton.setImage(Const.Image.likeSelected, for: .normal)
                    switch self.cardDetailWhere {
                    case 0: self.lottiePlay(lottie: self.lottieViewCardme)
                    case 1: self.lottiePlay(lottie: self.lottieViewCardyou)
                    default: print("error")
                    }
                }
                else {
                    self.likeButton.setImage(Const.Image.likeUnselected, for: .normal)
                }
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("requestErr")
            case .serverErr:
                print("requestErr")
            case .networkFail:
                print("requestErr")
            }
        }
    }
    
    func lottiePlay(lottie: AnimationView) {
        self.startLottie(lottie: lottie)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6){
            self.stopLottie(lottie: lottie)
        }
    }
    
    /// 이후 삭제할 더미데이터
    func setDummy() {
        titleLabel.text = " "
        fromLabel.text = " "
        contentLabel.text = " "
        dateLabel.text = " "
    }
    
    // MARK: - Objc Function
    @objc func trashCard() {
        deleteCard()
    }
    
    // MARK: - IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func menuButtonDidTap(_ sender: Any) {
        
    }
    
    @IBAction func makeCardButtonDidTap(_ sender: Any) {
        putCardInBox()
    }
    
    @IBAction func likeButtonDidTap(_ sender: Any) {
        likeCard()
    }
}
