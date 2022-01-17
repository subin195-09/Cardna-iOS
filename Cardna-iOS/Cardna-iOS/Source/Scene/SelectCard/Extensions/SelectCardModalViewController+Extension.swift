//
//  SelectCardModalViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

extension SelectCardModalViewController {
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 12, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension SelectCardModalViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /// 카드나
        if control == 0 {
            let cardme = cardMeList[indexPath.item]
            print("카드미", cardme)
            if cardme.mainOrder == nil {
                cardMeList[indexPath.item].changeMainState()
                mainCardList.append(contentsOf: [MainCardList(id: cardme.id,
                                                          mainOrder: -1,
                                                          isMe: true,
                                                          cardImg: cardme.cardImg,
                                                          title: cardme.title)])
            }
            else {
                cardMeList[indexPath.item].changeMainState()
                mainCardList.removeAll(where: { $0.id == cardme.id })
            }
            print("mainCardList", mainCardList)
        }
        /// 카드너
        else {
            let cardyou = cardYouList[indexPath.item]
            if cardyou.mainOrder == nil {
                cardYouList[indexPath.item].changeMainState()
                mainCardList.append(contentsOf: [MainCardList(id: cardyou.id,
                                                          mainOrder: -1,
                                                          isMe: true,
                                                          cardImg: cardyou.cardImg,
                                                          title: cardyou.title)])
            }
            else {
                cardYouList[indexPath.item].changeMainState()
                mainCardList.removeAll(where: { $0.id == cardyou.id })
            }
        }
        print("mainCardList", mainCardList)
    }
}

extension SelectCardModalViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        /// 카드나
        if control == 0 {
            return cardMeList.count
        }
        /// 카드너
        else {
            return cardYouList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        if control == 0 {
            let card = cardMeList[indexPath.item]
            cell.setData(image: card.cardImg, title: card.title, isMe: true, small: true, isMainCount: card.mainOrder)
        }
        else {
            let card = cardYouList[indexPath.item]
            cell.setData(image: card.cardImg, title: card.title, isMe: false, small: true, isMainCount: card.mainOrder)
        }
        return cell
    }
}
