//
//  HomeViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Property
    
    static var isHomeMine: Bool = true
    var cardList: [MainCardList] = []
    var friendID: Int? = nil
    var name: String = "지우(기본이름)"
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentUnderLineView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var friendCardPackButton: UIButton!
    
    // MARK: - VC LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        if friendID != nil { getMainCard(friendID: friendID) }
        else { getMainCard() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setUI()
        isFriendMain()
    }
    
    // MARK: - Function
    
    func isFriendMain() {
        if friendID != nil {
            editButton.isHidden = true
            collectionViewTopConstraint.constant = 24
            friendCardPackButton.isHidden = false
            nameLabel.text = "\(name)님은"
        }
    }
    
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
    
    func getMainCard(friendID: Int? = nil) {
        MainCardService.shared.getMainCard(friendID: friendID) { [weak self] response in
            print(response)
            guard let self = self else { return }
            switch response {
            case .success(let data):
                guard let res = data as? MainCardResponse else { return }
                self.cardList = res.mainCardList
                self.setCollectionView()
                self.collectionView.reloadData()
                if self.cardList[0].isMe == true {
                    self.commentUnderLineView.backgroundColor = .mainGreen
                }
                else {
                    self.commentUnderLineView.backgroundColor = .mainPurple
                }
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
