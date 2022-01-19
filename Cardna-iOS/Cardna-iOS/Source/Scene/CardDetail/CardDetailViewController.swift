//
//  CardDetailViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/12.
//

import UIKit
import SwiftUI

class CardDetailViewController: UIViewController {
    
    // MARK: - Property
    /// 분기처리 0: 카드나 1:카드너 2:카드아닌박스
    var cardDetailWhere: Int = 0
    var cardID: Int?
    var cardData: CardDetailResponse?
    
    // MARK: - IBOutlet

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addCardYouButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleBgView: UIView!
    @IBOutlet weak var menuButton: UIButton!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCardDetail()
        setUI()
        setDummy()
    }
    
    // MARK: - Function
    
    func setUI() {
        setLabelUI()
        setAddCardYouButtonUI()
        setUIByWhere(card: cardDetailWhere)
        setMenuButton()
    }
    
    func setUIByWhere(card: Int) {
        /// 색상 분기처리 (나중에 enum으로 바꿀예정)
        switch cardDetailWhere {
        case 0:
            titleBgView.backgroundColor = .mainGreen
            backButton.setImage(Const.Image.icbtBoxbackGreen, for: .normal)
        case 1:
            titleBgView.backgroundColor = .mainPurple
            backButton.setImage(Const.Image.icbtBoxbackPurple, for: .normal)
        case 2:
            titleBgView.backgroundColor = .cardDetailGray
            backButton.setImage(Const.Image.icbtBoxbackGray, for: .normal)
            addCardYouButton.isHidden = false
        default:
            print("default")
        }
    }
    
    func setMenuButton() {
        let inBox = UIAction(title: "보관") { action in
            self.putCardInBox()
        }
        let delete = UIAction(title: "삭제") { action in
            print("삭제")
        }
        menuButton.menu = UIMenu(title: "", children: [delete, inBox])
    }
    
    func setLabelUI() {
        titleLabel.font = .cardnaSh1Sbd
        fromLabel.font = .cardnaB1Rg
        contentLabel.font = .cardnaB1Rg
        dateLabel.font = .cardnaB1Rg
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
        fromLabel.text = "From. \(cardData?.name ?? "" )"
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
    
    /// 이후 삭제할 더미데이터
    func setDummy() {
        titleLabel.text = "힘이 들 땐 하늘을 봐.."
        fromLabel.text = "From. 솝트 디요미 · 혜원"
        contentLabel.text = "지금 이 말이 우리가 다시 시작하자는 건 아냐 그저 너의 남아있던 기억들이 떠올랐을 뿐이야 정말 하루도 빠짐없이 너는 사랑한다 말해줬었지 잠들기 전에 또 눈 뜨자마자 말해주던 너 생각이 나 말해보는 거야 예뻤어 날 바라봐 주던 그 눈빛 날 불러주던 그 목소리 다 다 그 모든 게 내겐 예뻤어 더 바랄 게 없는듯한 느낌 오직 너만이 주던 순간들 그 모든게 내겐"
        dateLabel.text = "2022/01/08"
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func menuButtonDidTap(_ sender: Any) {
        
    }
    
    @IBAction func makeCardButtonDidTap(_ sender: Any) {
        putCardInBox()
    }
}
