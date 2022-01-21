//
//  CardContainerCollectionViewCell.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/14.
//

import UIKit

class CardContainerCollectionViewCell: UICollectionViewCell {
    
    
    // MARK: - Property
    
    static let identifier = "CardContainerCollectionViewCell"
    var deviceWidth = UIScreen.main.bounds.width
    var isCardMe: Bool = true
    var delegate: CardPassProtocol?
    var isCardMeEmpty: Bool = true
    var isCardYouEmpty: Bool = true
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var cardPackCollectionView: UICollectionView!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionView()
        registerXib()
    }
    
    // MARK: - Function
    
    func registerXib() {
        let nib = UINib(nibName: CardCollectionViewCell.identifier, bundle: nil)
        cardPackCollectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        let nibAnotherCell = UINib(nibName: CardEmptyCollectionViewCell.identifier, bundle: nil)
        cardPackCollectionView.register(nibAnotherCell, forCellWithReuseIdentifier: CardEmptyCollectionViewCell.identifier)
    }
    
    func setCollectionView() {
        cardPackCollectionView.delegate = self
        cardPackCollectionView.dataSource = self
    }
    
    func setData(isCardMe: Bool, me: [CardMeList]?, you: [CardYouList]?) {
        self.isCardMe = isCardMe
        cardPackCollectionView.reloadData()
    }
}

extension CardContainerCollectionViewCell: UICollectionViewDelegate {
}

extension CardContainerCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isCardMe {
            if let cardMe = CardViewController.cardMeList {
                if cardMe.count > 0 {
                    isCardMeEmpty = false
                }
                else {
                    isCardMeEmpty = true
                }
            }
            else {
                isCardMeEmpty = true
            }
            if CardViewController.cardMeList?.count == 0 {
                return 1
            }
            else {
                return CardViewController.cardMeList?.count ?? 1
                
            }
        }
        else {
            if let cardYou = CardViewController.cardYouList {
                if cardYou.count > 0 {
                    isCardYouEmpty = false
                }
                else {
                    isCardYouEmpty = true
                }
            }
            else {
                isCardYouEmpty = true
            }
            if CardViewController.cardYouList?.count == 0 {
                return 1
            }
            else {
                return CardViewController.cardYouList?.count ?? 1
                
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            if isCardMe {
                if isCardMeEmpty {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardEmptyCollectionViewCell.identifier, for: indexPath) as? CardEmptyCollectionViewCell else { return UICollectionViewCell() }
                        return cell
                }
                else {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
                    cell.setData(image: CardViewController.cardMeList?[indexPath.item].cardImg ?? "", title: CardViewController.cardMeList?[indexPath.item].title ?? "", isMe: true, small: true)
                    return cell
                }
            }
            else {
                if isCardYouEmpty {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardEmptyCollectionViewCell.identifier, for: indexPath) as? CardEmptyCollectionViewCell else { return UICollectionViewCell() }
                        return cell}
                else {
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
                    cell.setData(image: CardViewController.cardYouList?[indexPath.item].cardImg ?? "", title: CardViewController.cardYouList?[indexPath.item].title ?? "", isMe: false, small: true)
                    return cell}
            }
        }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isCardMe {
            if !isCardMeEmpty {
                self.delegate?.pushDetailCard(cardID: CardViewController.cardMeList?[indexPath.row].id ?? 0, isMe: 0, isOthers: CardViewController.judgeWhom)
            }
        }
        else {
            if !isCardYouEmpty {
                self.delegate?.pushDetailCard(cardID: CardViewController.cardYouList?[indexPath.row].id ?? 0, isMe: 1, isOthers: CardViewController.judgeWhom)
            }
        }
    }
}

extension CardContainerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isCardMe {
            if isCardMeEmpty {
                let cellWidth = (deviceWidth-50)
                let cellHeight = cellWidth * (4/3)
                return CGSize(width: cellWidth, height: cellHeight)
            }
            else {
                let cellWidth = (deviceWidth-43)/2
                let cellHeight = cellWidth * (25/16)
                return CGSize(width: cellWidth, height: cellHeight)
            }
        }
        else {
            if isCardYouEmpty {
                let cellWidth = (deviceWidth-50)
                let cellHeight = cellWidth * (4/3)
                return CGSize(width: cellWidth, height: cellHeight)
            }
            else {
                let cellWidth = (deviceWidth-43)/2
                let cellHeight = cellWidth * (25/16)
                return CGSize(width: cellWidth, height: cellHeight)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if isCardMe {
            if isCardMeEmpty {
                return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            }
            else {
                return UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
            }
        }
        else {
            if isCardYouEmpty {
                return UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
            }
            else {
                return UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
}
