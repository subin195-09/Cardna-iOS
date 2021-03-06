//
//  ProfileCollectionViewCell.swift
//  Cardna-iOS
//
//  Created by κΉνμ on 2022/01/15.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileCollectionViewCell"

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    func setUI() {
        bgView.layer.cornerRadius = 10
        profileImageView.layer.cornerRadius = 36
        profileImageView.clipsToBounds = true
        nameLabel.textColor = .w1
        nameLabel.font = .cardnaB2Sbd
        commentLabel.textColor = .w1
        commentLabel.font = .cardnaB3Rg
    }
    
    func setData(image: String, name: String, comment: String) {
        profileImageView.setImage(with: image)
        nameLabel.text = name
        commentLabel.text = comment
    }
}
