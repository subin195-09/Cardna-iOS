//
//  UIFont+.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/11.
//

import UIKit

extension UIFont {
    public enum PretendardType: String {
        case semiBold = "SemiBold"
        case regular = "Regular"
        case light = "Light"
    }
    
    static func Pretendard(_ type: PretendardType, size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-\(type.rawValue)", size: size)!
    }
}

extension UIFont {

  class var cardnaH1Sbd: UIFont {
    return UIFont(name: "Pretendard-SemiBold", size: 28.0)!
  }

  class var cardnaH2Rg: UIFont {
    return UIFont(name: "Pretendard-Regular", size: 28.0)!
  }

  class var cardnaH3Sbd: UIFont {
    return UIFont(name: "Pretendard-SemiBold", size: 24.0)!
  }

  class var cardnaH4Rg: UIFont {
    return UIFont(name: "Pretendard-Regular", size: 24.0)!
  }

  class var cardnaH5Sbd: UIFont {
    return UIFont(name: "Pretendard-SemiBold", size: 20.0)!
  }

  class var cardnaH6Rg: UIFont {
    return UIFont(name: "Pretendard-Regular", size: 20.0)!
  }

  class var cardnaSh1Sbd: UIFont {
    return UIFont(name: "Pretendard-SemiBold", size: 18.0)!
  }

  class var cardnaSh2Rg: UIFont {
    return UIFont(name: "Pretendard-Regular", size: 18.0)!
  }

  class var cardnaSh3Sbd: UIFont {
    return UIFont(name: "Pretendard-SemiBold", size: 16.0)!
  }

  class var cardnaB1Rg: UIFont {
    return UIFont(name: "Pretendard-Regular", size: 16.0)!
  }

  class var cardnaB2Sbd: UIFont {
    return UIFont(name: "Pretendard-SemiBold", size: 14.0)!
  }

  class var cardnaB3Rg: UIFont {
    return UIFont(name: "Pretendard-Regular", size: 14.0)!
  }

  class var cardnaB4Sbd: UIFont {
    return UIFont(name: "Pretendard-SemiBold", size: 12.0)!
  }

  class var cardnaB5Rg: UIFont {
    return UIFont(name: "Pretendard-Regular", size: 12.0)!
  }

  class var cardnaC: UIFont {
    return UIFont(name: "Pretendard-Light", size: 12.0)!
  }

}
