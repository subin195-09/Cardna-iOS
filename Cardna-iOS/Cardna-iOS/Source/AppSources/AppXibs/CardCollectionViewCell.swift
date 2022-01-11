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
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Function
    
    func setUI() {
        bgView.layer.cornerRadius = 8
        bgView.backgroundColor = .mainGreen
        titleLabel.font = .cardnaB4Sbd
    }
    
    func setData(image: UIImage, title: String, isMe: Bool) {
        imageView.image = image
        titleLabel.text = title
        if isMe == true {
            bgView.backgroundColor = .mainGreen
        }
        else {
            bgView.backgroundColor = .mainPurple
        }
    }
}
