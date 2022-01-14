//
//  SelectCardViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/13.
//

import UIKit

class SelectCardViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setCollectionView()
        setUI()
    }
    
    // MARK: - Function
    
    func registerXib() {
        let nib = UINib(nibName: CardCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        collectionView.register(SelectCardHeaderCollectionReusableView.self, forSupplementaryViewOfKind: SelectCardViewController.sectionHeaderElementKind, withReuseIdentifier: SelectCardHeaderCollectionReusableView.identifier)
    }
    
    func setCollectionView() {
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
    }
    
    func setUI() {
        navigationTitle.textColor = .w1
        navigationTitle.font = .cardnaSh1Sbd
        countLabel.textColor = .w3
        countLabel.font = .Pretendard(.light, size: 12)
    }
    
    // MARK: - IBAction
    
    @IBAction func allCardButtonDidTap(_ sender: Any) {
        guard let cardVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectCardModalViewController") as? SelectCardModalViewController else { return }
        self.present(cardVC, animated: true, completion: nil)
    }
}
