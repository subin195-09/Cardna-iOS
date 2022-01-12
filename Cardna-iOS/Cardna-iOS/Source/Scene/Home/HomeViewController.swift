//
//  HomeViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Property
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        registerXib()
        setUI()
    }
    
    // MARK: - Function
    
    func setCollectionView() {
        collectionView.backgroundColor = .none
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        collectionView.dataSource = self
    }
    
    func registerXib() {
        let nib = UINib(nibName: CardCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
    
    func setUI() {
        setNavigationBarUI()
        setTitleUI()
    }
    
    func setNavigationBarUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setTitleUI() {
        nameLabel.font = .Pretendard(.light, size: 28)
        commentLabel.font = .cardnaH1Sbd
    }
}
