//
//  CardPackTitleCollectionViewCell.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/13.
//

import UIKit

class CardPackTitleCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "CardPackTitleCollectionViewCell"
    
    var inactiveImage: [UIImage] = [Const.Image.icbtCardmeInactive,
                                    Const.Image.icbtCardyouInactive]
    var activeImage: [UIImage] = [Const.Image.icbtCardmeActive,
                                  Const.Image.icbtCardyouActive]
    var activeColor: [UIColor] = [.mainGreen, .mainPurple]
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUI(index: Int, title: String) {
        iconImageView.image = inactiveImage[index]
        titleLabel.font = .Pretendard(.regular, size: 18)
        titleLabel.textColor = .w4
        titleLabel.text = title
    }
    
    func setSelectedUI(page: Int) {
        iconImageView.image = activeImage[page]
        titleLabel.textColor = activeColor[page]
        titleLabel.font = .Pretendard(.semiBold, size: 18)
    }
}
