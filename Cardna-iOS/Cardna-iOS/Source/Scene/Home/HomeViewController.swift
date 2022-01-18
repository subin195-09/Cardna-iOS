//
//  HomeViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Property
    
    var cardList: [MainCardList] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var countLabel: UILabel!
    
    // MARK: - VC LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        getMainCard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setUI()
    }
    
    // MARK: - Function
    
    func setCollectionView() {
        collectionView.backgroundColor = .none
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func registerXib() {
        let nib = UINib(nibName: CardCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
    
    func setUI() {
        setNavigationBarUI()
        setTitleUI()
        setEditButtonUI()
        setCountLabelUI()
    }
    
    func setNavigationBarUI() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setTitleUI() {
        nameLabel.font = .Pretendard(.light, size: 28)
        commentLabel.font = .cardnaH1Sbd
    }
    
    func setEditButtonUI() {
        editButton.tintColor = .w3
    }
    
    func setCountLabelUI() {
        countLabel.font = .cardnaB5Rg
    }
    
    func getMainCard() {
        MainCardService.shared.getMainCard { [weak self] response in
            print(response)
            guard let self = self else { return }
            switch response {
            case .success(let data):
                guard let res = data as? MainCardResponse else { return }
                self.cardList = res.mainCardList
                self.setCollectionView()
                self.collectionView.reloadData()
                self.countLabel.text = "현재셀/ \(self.cardList.count)"
                print("home", self.cardList)
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkErr")
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func editButtonDidTap(_ sender: Any) {
        let editVC = UIStoryboard(name: "SelectCard", bundle: nil).instantiateViewController(withIdentifier: "SelectCardViewController")
        self.navigationController?.pushViewController(editVC, animated: true)
    }
}
