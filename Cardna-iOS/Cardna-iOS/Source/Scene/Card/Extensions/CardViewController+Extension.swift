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
        return 2
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
            
            if indexPath.item == 0 {
                cell.setData(isCardMe: true, me: CardViewController.cardMeList, you: CardViewController.cardYouList)
            }
            else {
                cell.setData(isCardMe: false, me: CardViewController.cardMeList, you: CardViewController.cardYouList)
            }
            cell.delegate = self
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
            cellHeight =  self.view.safeAreaLayoutGuide.layoutFrame.height - 116
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
        cardContainerCollectionView.setContentOffset(CGPoint(x: CGFloat(nowPage) * UIScreen.main.bounds.width, y: 0.0), animated: true)
        cardPackTitleCollectionView.reloadData()
        cardContainerCollectionView.reloadData()
        moveIndicatorBarViewUI()
    }
}

extension CardViewController {
    
    func getCardPackAll(id: Int?) {
        CardPackService.shared.getCardPackAll(id: id) { response in
            switch response {
            case .success(let data):
                guard let data = data as? CardPackAllResponse else { return }
                CardViewController.cardMeList = data.cardMeList
                CardViewController.cardYouList = data.cardYouList
                self.cardCountLabel.text = "\(data.totalCardCnt)"
                self.setCollectionView()
                self.cardContainerCollectionView.reloadData()
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}

protocol CardPassProtocol {
    func pushDetailCard(cardID: Int, isMe: Int, isOthers: Bool)
}
