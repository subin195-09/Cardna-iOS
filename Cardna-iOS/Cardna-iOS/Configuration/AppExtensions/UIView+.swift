//
//  UIView+.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/11.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
