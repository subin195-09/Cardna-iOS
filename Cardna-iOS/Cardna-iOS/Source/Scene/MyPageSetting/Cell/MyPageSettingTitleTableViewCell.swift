//
//  MyPageSettingTitleTableViewCell.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/15.
//

import UIKit

class MyPageSettingTitleTableViewCell: UITableViewCell {

    // MARK: - Property
    
    static let identifier = "MyPageSettingTitleTableViewCell"
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var functionLabel: UILabel!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
