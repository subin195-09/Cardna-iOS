//
//  ListTableViewCell.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    static let identifier = "ListTableViewCell"

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUI() {
        bgView.layer.cornerRadius = 10
        titleLabel.font = .cardnaSh3Sbd
        fromLabel.font = .cardnaB5Rg
        backgroundColor = .clear
        dateLabel.font = .cardnaB5Rg
    }
    
    func setData(title: String, from: String, hasImage: Bool, date: String) {
        titleLabel.text = title
        fromLabel.text = from
        imageIcon.isHidden = !hasImage
        dateLabel.text = date
    }
}
