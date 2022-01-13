//
//  CardViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/13.
//

import UIKit

extension CardViewController: UICollectionViewDelegate {
    
}

extension CardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPackTitleCollectionViewCell.identifier, for: indexPath) as? CardPackTitleCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setUI(index: indexPath.row, title: cardPackTitle[indexPath.row])
        
        if indexPath.row == nowPage {
            cell.setSelectedUI(page: nowPage)
        }
    
        return cell
    }
}

extension CardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 69, height: 27)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 27
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nowPage = indexPath.row
        collectionView.reloadData()
        
        if nowPage == 0 {
            indicatorBarView.backgroundColor = .mainGreen
            indicatorLeadingConstraint.constant = 16
        }
        else {
            indicatorBarView.backgroundColor = .mainPurple
            indicatorLeadingConstraint.constant = 92
        }
        
        UIView.animate(withDuration: 0.15) {
            self.view.layoutIfNeeded()
        }
    }
}
