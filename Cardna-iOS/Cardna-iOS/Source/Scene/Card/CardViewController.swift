//
//  CardViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

import MaterialComponents.MaterialBottomSheet

extension CardViewController: CardPassProtocol {
    func pushDetailCard(cardID: Int, isMe: Int, isOthers: Bool) {
        guard let nextVC = UIStoryboard.init(name: "CardDetail", bundle: nil).instantiateViewController(withIdentifier: "CardDetailViewController") as? CardDetailViewController else { return }
        nextVC.cardID = cardID
        nextVC.isFriendsCardDetail = isOthers
        nextVC.cardDetailWhere = isMe
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

class CardViewController: UIViewController {
    
    // MARK: - Property
    
    var nowPage: Int = 0
    var cardPackTitle: [String] = ["카드나","카드너"]
    var isMyCardPack: Bool = true
    static var cardMeList: [CardMeList]? = []
    static var cardYouList: [CardYouList]? = []
    var friendID: Int?
    var friendName: String = "에르메스"
    static var judgeWhom: Bool = false
    
    // MARK: - IBOutlet
    
    // MARK: My Card Pack's navigation bar
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var addCardButton: UIButton!
    @IBOutlet weak var cardCountLabel: UILabel!
    
    // MARK: Friend's Card Pack's navigation bar
    @IBOutlet weak var friendNavigationBarView: UIView!
    @IBOutlet weak var friendBackButton: UIButton!
    @IBOutlet weak var friendNavigationTitleLabel: UILabel!
    @IBOutlet weak var friendWriteButton: UIButton!
    
    // MARK: Recycle Views
    @IBOutlet weak var cardPackTitleCollectionView: UICollectionView!
    @IBOutlet weak var indicatorBarView: UIView!
    @IBOutlet weak var indicatorLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var cardContainerCollectionView: UICollectionView!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setInitialCollectionView()
        setIsMyCardPack()
        //getCardInfo()
        setFriendNameLabel()
        setUI()
        notificationListner()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initialize()
        setIsMyCardPack()
        getCardInfo()
    }
    
    // MARK: - Function
    
    func setInitialCollectionView() {
        cardPackTitleCollectionView.delegate = self
        cardPackTitleCollectionView.dataSource = self
    }
    
    func setCollectionView() {
        [cardPackTitleCollectionView, cardContainerCollectionView].forEach {
            $0?.delegate = self
            $0?.dataSource = self
        }
    }
    
    private func initialize() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func getCardInfo() {
        getCardPackAll(id: friendID)
    }
    
    private func setUI() {
        showProperNavigationBar()
        setLabelUI()
        setViewUI()
    }
    
    func setIsMyCardPack() {
        if friendID == nil {
            isMyCardPack = true
            CardViewController.judgeWhom = false
        }
        else {
            isMyCardPack = false
            CardViewController.judgeWhom = true
        }
    }
    
    func showProperNavigationBar() {
        navigationBarView.isHidden = !isMyCardPack
        friendNavigationBarView.isHidden = isMyCardPack
    }
    
    func setLabelUI() {
        navigationTitleLabel.font = .Pretendard(.semiBold, size: 28)
        navigationTitleLabel.textColor = .w1
        cardCountLabel.font = .cardnaB1Rg
        cardCountLabel.textColor = .w3
        friendNavigationTitleLabel.font = .cardnaSh1Sbd
        friendNavigationTitleLabel.textColor = .w1
    }
    
    func setViewUI() {
        indicatorBarView.backgroundColor = .mainGreen
    }
    
    func setFriendNameLabel() {
        friendNavigationTitleLabel?.text = "\(friendName)님의 카드팩"
    }
    
    private func showBottomSheet() {
        
        guard let bottomSheetVC = UIStoryboard(name: "CardBottomSheet", bundle: nil).instantiateViewController(withIdentifier: "CardBottomSheetViewController") as? CardBottomSheetViewController else { return }
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: bottomSheetVC)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 221
        bottomSheet.adjustHeightForSafeAreaInsets = false
        
        self.present(bottomSheet, animated: true, completion: nil)
    }
    
    private func notificationListner() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(goToCardMe),
                                               name: Notification.Name("goToCardMe"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(goToCardNotYetBox),
                                               name: Notification.Name("goToCardNotYetBox"),
                                               object: nil)
    }
    
    // MARK: - IBAction
    
    @IBAction func addCardButtonDidTap(_ sender: Any) {
        showBottomSheet()
    }
    
    @IBAction func friendBackButtonDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func friendWriteButtonDidTap(_ sender: Any) {
        guard let addVC = UIStoryboard(name: "AddCardYouViewController", bundle: nil).instantiateViewController(withIdentifier: "AddCardYouViewController") as? AddCardYouViewController else { return }
        self.navigationController?.pushViewController(addVC, animated: true)
    }
    
    @objc
    private func goToCardMe(notification: NSNotification) {
        let nextVC = AddCardViewController()
        nextVC.isMe = notification.object as? Bool ?? true
        nextVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc
    private func goToCardNotYetBox(notification: NSNotification) {
        guard let cardNotYetBoxVC = UIStoryboard(name: "CardNotYetBox", bundle: nil).instantiateViewController(withIdentifier: "CardNotYetBoxViewController") as? CardNotYetBoxViewController else { return }
        cardNotYetBoxVC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(cardNotYetBoxVC, animated: true)
    }
}
