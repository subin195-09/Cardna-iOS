//
//  CardViewController+Extension.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/13.
//

import UIKit

extension CardViewController {
    
    func moveIndicatorBarViewUI() {
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

extension CardViewController: UICollectionViewDelegate {
    
}

extension CardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cardPackTitleCollectionView {
            return 2
        }
        else if collectionView == cardContainerCollectionView {
            return 2
        }
        else {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cardPackTitleCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardPackTitleCollectionViewCell.identifier, for: indexPath) as? CardPackTitleCollectionViewCell else { return UICollectionViewCell() }
            
            cell.setUI(index: indexPath.row, title: cardPackTitle[indexPath.row])
            
            if indexPath.row == nowPage {
                cell.setSelectedUI(page: nowPage)
            }
        
            return cell
        }
        else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardContainerCollectionViewCell.identifier, for: indexPath) as? CardContainerCollectionViewCell else { return UICollectionViewCell() }
            
            cell.setUI(page: nowPage)
            
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let deviceWidth: CGFloat = UIScreen.main.bounds.width
        
        if scrollView.contentOffset.x == 0 {
            nowPage = 0
        }
        else if scrollView.contentOffset.x == deviceWidth {
            nowPage = 1
        }
        
        moveIndicatorBarViewUI()
        cardPackTitleCollectionView.reloadData()
        cardContainerCollectionView.reloadData()
    }
}

extension CardViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var cellWidth: CGFloat
        var cellHeight: CGFloat
        
        if collectionView == cardPackTitleCollectionView {
            cellWidth = 69
            cellHeight = 27
        }
        else {
            cellWidth = UIScreen.main.bounds.width
            cellHeight = 300
        }
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        var interSpace: CGFloat = 0
        
        if collectionView == cardPackTitleCollectionView {
            interSpace = 27
        }
        
        return interSpace
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        nowPage = indexPath.row
        cardPackTitleCollectionView.reloadData()
        cardContainerCollectionView.reloadData()
        moveIndicatorBarViewUI()
    }
}
