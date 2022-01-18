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
    
    func setData(isCardMe: Bool, index: Int, isSelected: Bool) {
        if (isCardMe) {
            switch index {
            case 0:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolSmileSelect
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolSmile
                }
            case 1:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolHeartSelect
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolHeart
                }
            case 2:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolDiaSelect
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolDia
                }
            case 3:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolSpadeSelect
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolSpade
                }
            case 4:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolCloverSelect
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolClover
                }
            default:
                break
            }
        } else {
            switch index {
            case 0:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolSmileSelectPur
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolSmilePur
                }
            case 1:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolHeartSelectPur
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolHeartPur
                }
            case 2:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolDiaSelectPur
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolDiaPur
                }
            case 3:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolSpadeSelectPur
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolSpadePur
                }
            case 4:
                if isSelected {
                    symbolIconImageView.image = Const.Image.icbtSymbolCloverSelectPur
                } else {
                    symbolIconImageView.image = Const.Image.icbtSymbolCloverPur
                }
            default:
                break
            }
        }
    }
}
