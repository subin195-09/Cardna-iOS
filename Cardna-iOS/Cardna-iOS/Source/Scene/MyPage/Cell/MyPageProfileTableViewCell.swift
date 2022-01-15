//
//  MyPageProfileTableViewCell.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

class MyPageProfileTableViewCell: UITableViewCell {
    
    static let identifier = "MyPageProfileTableViewCell"

    @IBOutlet weak var profileImageContainerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI() {
        backgroundColor = .clear
        profileImageView.layer.cornerRadius = 22
        profileImageView.clipsToBounds = true
        nameLabel.font = .cardnaH6Rg
        nameLabel.textColor = .w1
        emailLabel.font = .cardnaB5Rg
        emailLabel.textColor = .w3
    }
}
