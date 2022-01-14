//
//  SelectCardHeaderCollectionReusableView.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/14.
//

import UIKit

class SelectCardHeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "SelectCardHeaderCollectionReusableView"
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "나를 가장 잘 표현하는 카드를\n대표카드로 지정해보세요!"
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .cardnaH4Rg
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        self.backgroundColor = .black
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontForContentSizeCategory = true
        
        let inset = CGFloat(16)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: CGFloat(25)),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        
        let attributedStr = NSMutableAttributedString(string: titleLabel.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        attributedStr.addAttribute(.foregroundColor, value: UIColor.mainGreen , range: (titleLabel.text! as NSString).range(of: "대표카드"))
        attributedStr.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedStr.length))
        titleLabel.attributedText = attributedStr
        titleLabel.attributedText = titleLabel.text?.textSpacing(lineSpacing: 5)
    }
}
