//
//  HomeViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/12.
//

import UIKit

extension HomeViewController {
    
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(284/375), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.visibleItemsInvalidationHandler = { [weak self] (items, offset, env) -> Void in
            //print(Int(max(0, round(offset.x / UIScreen.main.bounds.width * (284/375) ))))
            guard let self = self else { return }
            let index = Int(max(0, round(offset.x / 284)))+1
            self.countLabel.text = "\(Int(max(0, round(offset.x / 284)))+1) / \(self.cardList.count)"
            self.commentLabel.text = self.cardList[index-1].title
            if self.cardList[index-1].isMe {
                self.commentUnderLineView.backgroundColor = .mainGreenAlpha
            }
            else {
                self.commentUnderLineView.backgroundColor = .mainPurpleAlpha
            }
        }
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        guard let detailVC = UIStoryboard(name: "CardDetail", bundle: nil).instantiateViewController(withIdentifier: "CardDetailViewController") as? CardDetailViewController else { return }
        detailVC.cardID = cardList[indexPath.row].id
        detailVC.cardDetailWhere = cardList[indexPath.row].isMe ? 0 : 1
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(image: cardList[indexPath.item].cardImg,
                     title: cardList[indexPath.item].title,
                     isMe: cardList[indexPath.item].isMe,
                     small: false)
        return cell
    }
}
