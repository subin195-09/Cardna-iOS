//
//  SelectCardModalViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/15.
//

import UIKit

protocol MainCardSelectProtocol {
    func sendMainCard(cardList: [MainCardList])
}

class SelectCardModalViewController: UIViewController {
    
    // MARK: - Property
    
    var selectDelegate: MainCardSelectProtocol?
    var userID: Int?
    var control: Int = 0
    var mainCardList: [MainCardList] = []
    var cardMeList: [CardMeList] = []
    var cardYouList: [CardYouList] = []
    
    // MARK: - IBOutlet

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cardSegmentedControl: UISegmentedControl!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        registerXib()
        getCardPackAll(id: userID)
    }
    
    // MARK: - Function
    
    func setUI() {
        countLabel.textColor = .w1
        countLabel.font = .Pretendard(.light, size: 12)
        completeButton.tintColor = .w1
        cardSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.w1, .font: UIFont.cardnaB2Sbd], for: .selected)
        cardSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.w2, .font: UIFont.cardnaB3Rg], for: .normal)
    }
    
    func registerXib() {
        let nib = UINib(nibName: CardCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
    }
    
    func setCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
    }
    
    func getCardPackAll(id: Int?) {
        CardPackService.shared.getCardPackAll(id: id) { response in
            switch response {
            case .success(let data):
                guard let data = data as? CardPackAllResponse else { return }
                self.cardMeList = data.cardMeList
                self.cardYouList = data.cardYouList
                self.setCollectionView()
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
    
    // MARK: - IBAction
    
    @IBAction func switchControl(_ sender: UISegmentedControl) {
        control = sender.selectedSegmentIndex
        collectionView.reloadData()
    }
    
    @IBAction func completeButtonDidTap(_ sender: Any) {
        print("최종", mainCardList)
        self.selectDelegate?.sendMainCard(cardList: mainCardList)
        self.dismiss(animated: true, completion: nil)
    }
}
