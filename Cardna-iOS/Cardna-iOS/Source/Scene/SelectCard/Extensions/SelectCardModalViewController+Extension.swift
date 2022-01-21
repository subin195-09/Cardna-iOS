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
        
        if control == 0 {
            let list = mainCardList.filter{ $0.id == cardMeList[indexPath.item].id }
            if list.count > 0 {
                // 이미 있는 경우 -> 삭제
                mainCardList.removeAll(where: { $0.id == cardMeList[indexPath.item].id })
            }
            else {
                // 없는경우 -> 추가
                mainCardList.append(contentsOf: [MainCardList(id: cardMeList[indexPath.item].id,
                                                              mainOrder: mainCardList.count,
                                                              isMe: true,
                                                              cardImg: cardMeList[indexPath.item].cardImg,
                                                              title: cardMeList[indexPath.item].title)])
            }
        }
        else {
            let list = mainCardList.filter{ $0.id == cardYouList[indexPath.item].id }
            if list.count > 0 {
                // 이미 있는 경우 -> 삭제
                mainCardList.removeAll(where: { $0.id == cardYouList[indexPath.item].id })
            }
            else {
                // 없는경우 -> 추가
                mainCardList.append(contentsOf: [MainCardList(id: cardYouList[indexPath.item].id,
                                                              mainOrder: mainCardList.count,
                                                              isMe: false,
                                                              cardImg: cardYouList[indexPath.item].cardImg,
                                                              title: cardYouList[indexPath.item].title)])
            }
        }

        print(cardMeList)
        print(cardYouList)
        //setIndex(cardMeList: &cardMeList, cardYouList: &cardYouList, mainCardList: mainCardList)
        
        for i in 0..<cardMeList.count {
            var isMain = false
            for j in 0..<mainCardList.count {
                if (cardMeList[i].id == mainCardList[j].id) {
                    cardMeList[i].changeMainState(order: j)
                    isMain = true
                    break
                }
            }
            if isMain == false {
                cardMeList[i].mainOrder = nil
            }
        }
        
        for i in 0..<cardYouList.count {
            var isMain = false
            for j in 0..<mainCardList.count {
                if (cardYouList[i].id == mainCardList[j].id) {
                    cardYouList[i].changeMainState(order: j)
                    isMain = true
                    break
                }
            }
            if isMain == false {
                cardYouList[i].mainOrder = nil
            }
        }
        
        print(mainCardList)
        print(mainCardList.count)
        collectionView.reloadData()
    }
    
    func setIndex(cardMeList: inout [CardMeList],
                  cardYouList: inout [CardYouList],
                  mainCardList: [MainCardList]) {
        for i in 0..<cardMeList.count {
            var isMain = false
            for j in 0..<mainCardList.count {
                if (cardMeList[i].id == mainCardList[j].id) {
                    cardMeList[i].changeMainState(order: j)
                    isMain = true
                    break
                }
            }
            if isMain == false {
                cardMeList[i].changeMainState(order: nil)
            }
        }
        
        for i in 0..<cardYouList.count {
            var isMain = false
            for j in 0..<mainCardList.count {
                if (cardYouList[i].id == mainCardList[j].id) {
                    cardYouList[i].changeMainState(order: j)
                    isMain = true
                    break
                }
            }
            if isMain == false {
                cardYouList[i].changeMainState(order: nil)
            }
        }
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
            cell.setData(image: card.cardImg,
                         title: card.title,
                         isMe: true,
                         small: true,
                         isMainCount: card.mainOrder,
                         selected: card.mainOrder != nil)
        }
        else {
            let card = cardYouList[indexPath.item]
            cell.setData(image: card.cardImg,
                         title: card.title,
                         isMe: false,
                         small: true,
                         isMainCount: card.mainOrder,
                         selected: card.mainOrder != nil)
        }
        countLabel.text = "\(mainCardList.count) / 7"
        return cell
    }
}
