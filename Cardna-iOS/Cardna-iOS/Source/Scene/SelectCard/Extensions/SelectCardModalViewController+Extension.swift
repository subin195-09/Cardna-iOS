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

extension SelectCardModalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(image: "https://firebasestorage.googleapis.com/v0/b/cardna-29f5b.appspot.com/o/20220115_212100_64397479199.jpeg?alt=media", title: "ㅋㅋㅋ ", isMe: true, small: true)
        return cell
    }
}
