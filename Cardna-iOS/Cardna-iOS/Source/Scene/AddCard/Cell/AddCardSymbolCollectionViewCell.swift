//
//  AddCardSymbolCollectionViewCell.swift
//  Cardna-iOS
//
//  Created by 이남준 on 2022/01/14.
//

import UIKit

class AddCardSymbolCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AddCardSymbolCollectionViewCell"
    
    @IBOutlet weak var symbolIconImageView: UIImageView!
    
    func setData(symbolIconImage: UIImage) {
        symbolIconImageView.image = symbolIconImage
    }
}
