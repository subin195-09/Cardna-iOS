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
    var selectView: Bool = false
    var delegate: CardPassProtocol?
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var isMainCountLabel: UILabel!
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var countBackgroundView: UIView!
    @IBOutlet weak var bgViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bgViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var minusImageView: UIImageView!
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        titleLabel.text = nil
        bgView.backgroundColor = .w2
        isMainCountLabel.text = nil
        countBackgroundView.isHidden = true
    }
    
    // MARK: - Function
    
    func setUI() {
        bgView.layer.cornerRadius = 8
        bgView.layer.borderColor = UIColor.black.cgColor
        bgView.layer.borderWidth = 1
        bgView.backgroundColor = .mainGreen
        titleLabel.font = .cardnaSh1Sbd
        titleLabel.textColor = UIColor.init(red: 18/255.0, green: 18/255.0, blue: 18/255.0, alpha: 1.0)
        countBackgroundView.layer.cornerRadius = 10
        countBackgroundView.layer.borderWidth = 1
        countBackgroundView.layer.borderColor = UIColor.white.cgColor
        isMainCountLabel.font = .cardnaB4Sbd
        if selectView {
            setIsSelectViewUI()
        }
    }
    
    func setIsSelectViewUI() {
        bgViewTopConstraint.constant = 14
        bgViewTrailingConstraint.constant = 14
        minusImageView.isHidden = false
    }
    
    func setData(image: String, title: String, isMe: Bool, small: Bool, isMainCount: Int? = nil, selected: Bool = false, isSelectedView: Bool = false) {
        imageView.setImage(with: image)
        titleLabel.text = title
        if isMe == true {
            bgView.backgroundColor = .mainGreen
        }
        else {
            bgView.backgroundColor = .mainPurple
        }
        
        if small {
            titleLabel.font = .cardnaB4Sbd
            titleLeadingConstraint.constant = 12
            titleTrailingConstraint.constant = 12
            titleTopConstraint.constant = 3
        }
        else {
            titleLabel.font = .cardnaSh1Sbd
            titleLeadingConstraint.constant = 20
            titleTrailingConstraint.constant = 20
            titleTopConstraint.constant = 5
        }
        
        if isMainCount != nil {
            isMainCountLabel.text = "\((isMainCount ?? 0)+1)"
            countBackgroundView.isHidden = false
        } else {
            countBackgroundView.isHidden = true
        }
        
        selectedView.isHidden = !selected
        
        selectView = isSelectedView
        if isSelectedView {
            setIsSelectViewUI()
        }
        
    }
}
