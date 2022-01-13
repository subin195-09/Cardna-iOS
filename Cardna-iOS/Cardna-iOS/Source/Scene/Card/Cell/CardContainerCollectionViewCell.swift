//
//  CardContainerCollectionViewCell.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/14.
//

import UIKit

class CardContainerCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Property
    
    static let identifier = "CardContainerCollectionViewCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var exampleView: UIView!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Function
    
    func setUI(page: Int) {
        if page == 0 {
            exampleView.backgroundColor = .red
        }
        else {
            exampleView.backgroundColor = .blue
        }
    }
}
