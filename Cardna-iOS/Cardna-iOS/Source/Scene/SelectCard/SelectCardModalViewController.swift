//
//  SelectCardModalViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

class SelectCardModalViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        registerXib()
        setCollectionView()
    }
    
    // MARK: - Function
    
    func setUI() {
        countLabel.textColor = .w1
        countLabel.font = .Pretendard(.light, size: 12)
        completeButton.tintColor = .w1
    }
    
    func registerXib() {
        let nib = UINib(nibName: CardCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
}
