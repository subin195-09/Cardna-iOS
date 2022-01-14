//
//  CardDetailViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/12.
//

import UIKit

class CardDetailViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var addCardYouButton: UIButton!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDummy()
    }
    
    // MARK: - Function
    
    func setUI() {
        setLabelUI()
        setAddCardYouButtonUI()
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
    
    /// 이후 삭제할 더미데이터
    func setDummy() {
        titleLabel.text = "힘이 들 땐 하늘을 봐.."
        fromLabel.text = "From. 솝트 디요미 · 혜원"
        contentLabel.text = "지금 이 말이 우리가 다시 시작하자는 건 아냐 그저 너의 남아있던 기억들이 떠올랐을 뿐이야 정말 하루도 빠짐없이 너는 사랑한다 말해줬었지 잠들기 전에 또 눈 뜨자마자 말해주던 너 생각이 나 말해보는 거야 예뻤어 날 바라봐 주던 그 눈빛 날 불러주던 그 목소리 다 다 그 모든 게 내겐 예뻤어 더 바랄 게 없는듯한 느낌 오직 너만이 주던 순간들 그 모든게 내겐"
        dateLabel.text = "2022/01/08"
    }
}