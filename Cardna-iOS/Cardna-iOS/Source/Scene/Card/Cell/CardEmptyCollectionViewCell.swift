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
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var cellBackgroundView: UIView!
    @IBOutlet weak var cellExplainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setCellUI()
    }

    func setCellUI() {
        cellExplainLabel.numberOfLines = 0
        cellExplainLabel.textAlignment = .center
        cellExplainLabel.textColor = .w1
        cellExplainLabel.text =
        """
        아직 카드가 없어요!
        카드를 만들어주거나
        카드를 써줘보아요!
        """
        cellExplainLabel.font = .Pretendard(.semiBold, size: 16)
        cellExplainLabel.sizeToFit()
    }
}
