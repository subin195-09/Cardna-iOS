//
//  HomeViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Property
    
    var isHomeMine: Bool = true
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
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var navigationButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
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
        setCollectionView()
    }
    
    // MARK: - Function
    
    func isFriendMain() {
        if friendID != nil {
            editButton.isHidden = true
            collectionViewTopConstraint.constant = 24
            friendCardPackButton.isHidden = false
            nameLabel.text = "\(name)님은"
            navigationButton.setImage(Const.Image.icbtWrite, for: .normal)
            addFriendButton.isHidden = false
            backButton.isHidden = false
        }
        else {
            nameLabel.text = "\(NetworkConstant.name)님은"
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
        setLayout()
    }
    
    func setLayout() {
        collectionViewHeight.constant = UIScreen.main.bounds.height * (430/812)
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
                if self.cardList.count == 0 {
                    self.countLabel.isHidden = true
                    self.commentLabel.text = "아직 대표카드가 없어요!"
                } else {
                    self.countLabel.isHidden = false
                }
                self.collectionView.reloadData()
                if self.cardList.count > 0 {
                    if self.cardList[0].isMe == true {
                        self.commentUnderLineView.backgroundColor = .mainGreenAlpha
                    }
                    else {
                        self.commentUnderLineView.backgroundColor = .mainPurpleAlpha
                    }
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
    
    @IBAction func friendCardPackButtonDidTap(_ sender: Any) {
        guard let nextVC = UIStoryboard(name: "Card", bundle: nil).instantiateViewController(withIdentifier: "CardViewController") as? CardViewController else { return }
        nextVC.friendID = self.friendID
        nextVC.friendName = self.name
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func friendAddButtonDidTap(_ sender: Any) {
        print("친구추가")
    }
    
    @IBAction func navigationButtonDidTap(_ sender: Any) {
        if friendID != nil {
            guard let addVC = UIStoryboard(name: "AddCardYouViewController", bundle: nil).instantiateViewController(withIdentifier: "AddCardYouViewController") as? AddCardYouViewController else { return }
            self.navigationController?.pushViewController(addVC, animated: true)
        }
        else {
            self.showToastTop(message: "준비중인 기능입니다.", font: .cardnaB3Rg)
        }
    }
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
