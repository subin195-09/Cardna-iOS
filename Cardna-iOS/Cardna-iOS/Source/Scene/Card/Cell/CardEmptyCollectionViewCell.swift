//
//  CardEmptyCollectionViewCell.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/21.
//

import UIKit

class CardEmptyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "CardEmptyCollectionViewCell"
    var isMyPage: Bool = false
    var isCardMe: Bool = false
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var cellExplainLabel: UILabel!
    @IBOutlet weak var buttonBackgroundView: UIView!
    @IBOutlet weak var buttonIconImageView: UIImageView!
    @IBOutlet weak var buttonTitleLabel: UILabel!
    @IBOutlet weak var writeButton: UIButton!
    @IBOutlet weak var explainLabelTopConstraint: NSLayoutConstraint!
    
    // MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setCellUI()
    }

    func setCellUI() {
        cellBackgroundView.layer.cornerRadius = 10
        cellBackgroundView.layer.borderWidth = 1
        cellBackgroundView.layer.borderColor = UIColor.w4.cgColor
        cellExplainLabel.numberOfLines = 0
        cellExplainLabel.textAlignment = .center
        cellExplainLabel.textColor = .w3
        cellExplainLabel.font = .Pretendard(.regular, size: 16)
        cellExplainLabel.sizeToFit()
        buttonBackgroundView.layer.cornerRadius = 20
        buttonBackgroundView.layer.borderColor = UIColor.mainGreen.cgColor
        buttonBackgroundView.layer.borderWidth = 1
        buttonTitleLabel.sizeToFit()
        buttonTitleLabel.font = .cardnaB1Rg
    }
    
    func setCellData() {
        if isMyPage {
            cellBackgroundView.layer.borderWidth = 1
            explainLabelTopConstraint.constant = 162
            if isCardMe {
                cellExplainLabel.text = "나에 대한 카드를 새로\n작성해보세요"
                buttonBackgroundView.layer.borderColor = UIColor.mainGreen.cgColor
                buttonIconImageView.image = Const.Image.icbtCardme
                buttonTitleLabel.text = "카드나 작성"
                buttonTitleLabel.textColor = .mainGreen
                setAppear(appear: true)
            }
            else {
                cellExplainLabel.text = "타인이 말하는 나를 카드로\n만들어보세요"
                buttonBackgroundView.layer.borderColor = UIColor.mainPurple.cgColor
                buttonIconImageView.image = Const.Image.icbtCardyou
                buttonTitleLabel.text = "카드너 추가"
                buttonTitleLabel.textColor = .mainPurple
                setAppear(appear: true)
            }
        }
        else {
            cellBackgroundView.layer.borderWidth = 0
            if isCardMe {
                explainLabelTopConstraint.constant = 197
                cellExplainLabel.text = "아직 카드가 없어요"
                setAppear(appear: false)
            }
            else {
                explainLabelTopConstraint.constant = 162
                cellExplainLabel.text = "친구 소개글을 작성해보세요!"
                buttonBackgroundView.layer.borderColor = UIColor.w2.cgColor
                buttonIconImageView.image = Const.Image.icbtWrite
                buttonTitleLabel.text = "타인소개 작성"
                buttonTitleLabel.textColor = .w2
                setAppear(appear: true)
            }
        }
    }
    
    func setAppear(appear: Bool) {
        buttonBackgroundView.isHidden = !appear
        writeButton.isHidden = !appear
    }
}
