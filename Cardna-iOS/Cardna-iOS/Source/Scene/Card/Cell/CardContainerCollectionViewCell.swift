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
        cardPackCollectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
    
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

extension CardContainerCollectionViewCell: UICollectionViewDelegate {
}

extension CardContainerCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(image: UIImage(), title: "경민이 최고 킹.", isMe: cellPage == 0 ? true : false, small: true)
        return cell
    }
}
