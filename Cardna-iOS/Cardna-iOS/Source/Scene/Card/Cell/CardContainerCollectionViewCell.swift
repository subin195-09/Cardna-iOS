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
    var cellPage: Int = 0
    var deviceWidth = UIScreen.main.bounds.width
    
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var cardPackCollectionView: UICollectionView!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        setCollectionView()
    }
    
    // MARK: - Function
    
    func registerXib() {
        let nib = UINib(nibName: CardCollectionViewCell.identifier, bundle: nil)
        cardPackCollectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
    
    func setCollectionView() {
        cardPackCollectionView.delegate = self
        cardPackCollectionView.dataSource = self
    }
}

extension CardContainerCollectionViewCell: UICollectionViewDelegate {
}

extension CardContainerCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(image: "https://firebasestorage.googleapis.com/v0/b/cardna-29f5b.appspot.com/o/20220115_212100_64397479199.jpeg?alt=media", title: "경민이 최고 킹.", isMe: cellPage == 0 ? true : false, small: true)
        return cell
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
