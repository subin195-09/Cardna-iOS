//
//  MyPageFriendsTableViewCell.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

protocol MyPageFriendSelectProtocol {
    func pushFriendMainCard(friendID: Int)
}

class MyPageFriendsTableViewCell: UITableViewCell {
    
    static let identifier = "MyPageFriendsTableViewCell"
    var friendList: [FriendList] = []
    var delegate: MyPageFriendSelectProtocol?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerXib()
        setCollectionView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCollectionView() {
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func registerXib() {
        let nib = UINib(nibName: ProfileCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
    }
    
    func setData(friendList: [FriendList]) {
        self.friendList = friendList
    }
}

extension MyPageFriendsTableViewCell {
    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6, bottom: 0, trailing: 6)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(186/375))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 12, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

extension MyPageFriendsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("mypage friend CollectionView", indexPath.item)
        self.delegate?.pushFriendMainCard(friendID: friendList[indexPath.item].id)
    }
}

extension MyPageFriendsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(image: friendList[indexPath.item].userImg,
                     name: friendList[indexPath.item].name,
                     comment: friendList[indexPath.item].sentence ?? "")
        return cell
    }
}
