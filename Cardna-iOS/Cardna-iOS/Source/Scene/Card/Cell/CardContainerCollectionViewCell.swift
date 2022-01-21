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
            return CardViewController.cardMeList?.count ?? 0
        }
        else {
            return CardViewController.cardYouList?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isCardMe {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(image: CardViewController.cardMeList?[indexPath.item].cardImg ?? "", title: CardViewController.cardMeList?[indexPath.item].title ?? "", isMe: true, small: true)
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
            cell.setData(image: CardViewController.cardYouList?[indexPath.item].cardImg ?? "", title: CardViewController.cardYouList?[indexPath.item].title ?? "", isMe: false, small: true)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if isCardMe {
            self.delegate?.pushDetailCard(cardID: CardViewController.cardMeList?[indexPath.row].id ?? 0, isMe: 0, isOthers: CardViewController.judgeWhom)
        }
        else {
            self.delegate?.pushDetailCard(cardID: CardViewController.cardYouList?[indexPath.row].id ?? 0, isMe: 1, isOthers: CardViewController.judgeWhom)
        }
    }
}

extension CardContainerCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (deviceWidth-43)/2
        let cellHeight = cellWidth * (25/16)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 14, left: 16, bottom: 14, right: 16)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 11
    }
}
