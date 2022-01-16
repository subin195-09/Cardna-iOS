//
//  CardCollectionViewCell.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/11.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    public static let identifier = "CardCollectionViewCell"

    // MARK: - IBOutlet
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Function
    
    func setUI() {
        bgView.layer.cornerRadius = 8
        bgView.backgroundColor = .mainGreen
        titleLabel.font = .cardnaSh1Sbd
        
    }
    
    func setData(image: UIImage, title: String, isMe: Bool, small: Bool) {
        imageView.image = image
        titleLabel.text = title
        if isMe == true {
            bgView.backgroundColor = .mainGreen
        }
        else {
            bgView.backgroundColor = .mainPurple
        }
        
        if small {
            titleLabel.font = .cardnaB4Sbd
            titleLeadingConstraint.constant = 12
            titleTrailingConstraint.constant = 12
            titleTopConstraint.constant = 3
        }
        else {
            titleLabel.font = .cardnaSh1Sbd
            titleLeadingConstraint.constant = 20
            titleTrailingConstraint.constant = 20
            titleTopConstraint.constant = 5
        }
    }
}
