//
//  String+.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/12.
//

import UIKit

extension String {
    
    // 행간지정
    func textSpacing(lineSpacing: Int) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = CGFloat(lineSpacing)
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSRange(location: 0,
                                                     length: attributedString.length))
        attributedString.addAttribute(NSAttributedString.Key.kern,
                                      value: -0.16,
                                      range: NSRange(location: 0,
                                                     length: attributedString.length))
        return attributedString
    }
}
