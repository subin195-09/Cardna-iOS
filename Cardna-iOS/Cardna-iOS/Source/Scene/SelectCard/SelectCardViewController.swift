//
//  SelectCardViewController.swift
//  Cardna-iOS
//
//  Created by κΉνμ on 2022/01/13.
//

import UIKit

class SelectCardViewController: UIViewController {
    
    var mainCards: [MainCardList] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet var bgView: UIView!
    @IBOutlet weak var navigationBgView: UIView!
    @IBOutlet weak var countBgView: UIView!
    @IBOutlet weak var navigationTitle: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMainCard()
        registerXib()
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
        collectionView.backgroundColor = .black
    }
    
    func setUI() {
        bgView.backgroundColor = .black
        navigationTitle.textColor = .w1
        navigationTitle.font = .cardnaSh1Sbd
        countLabel.textColor = .w3
        countLabel.font = .Pretendard(.light, size: 12)
        countBgView.backgroundColor = .black
        navigationBgView.backgroundColor = .black
    }
    
    func getMainCard() {
        MainCardService.shared.getMainCard { response in
            switch response {
            case .success(let data):
                guard let data = data as? MainCardResponse else { return }
                self.mainCards = data.mainCardList
                self.countLabel.text = "\(data.mainCardList.count) / 7"
                print(self.mainCards)
                self.setCollectionView()
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func putMainCard() {
        
        var cardIndexs: [Int] = []
        
        for i in mainCards {
            cardIndexs.append(contentsOf: [i.id])
        }
        
        MainCardService.shared.putMainCard(cardIndexList: cardIndexs) { response in
            switch response {
            case .success(_):
                self.navigationController?.popViewController(animated: true)
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverERR")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func allCardButtonDidTap(_ sender: Any) {
        guard let cardVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectCardModalViewController") as? SelectCardModalViewController else { return }
        cardVC.mainCardList = mainCards
        cardVC.selectDelegate = self
        self.present(cardVC, animated: true, completion: nil)
    }

    @IBAction func completeButtonDidTap(_ sender: Any) {
        print("complete", mainCards)
        putMainCard()
    }
}
