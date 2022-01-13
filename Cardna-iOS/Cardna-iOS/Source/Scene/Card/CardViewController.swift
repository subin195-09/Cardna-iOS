//
//  CardViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

import MaterialComponents.MaterialBottomSheet

class CardViewController: UIViewController {
    
    // MARK: - Property
    
    var nowPage: Int = 0
    var cardPackTitle: [String] = ["카드나","카드너"]
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var addCardButton: UIButton!
    @IBOutlet weak var cardCountLabel: UILabel!
    
    @IBOutlet weak var cardPackTitleCollectionView: UICollectionView!
    @IBOutlet weak var indicatorBarView: UIView!
    
    @IBOutlet weak var indicatorLeadingConstraint: NSLayoutConstraint!
    
    
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        initialize()
        setLabelUI()
        setViewUI()
    }
    
    // MARK: - Function
    
    private func setCollectionView() {
        [cardPackTitleCollectionView].forEach {
            $0?.delegate = self
            $0?.dataSource = self
        }
    }
    
    private func initialize() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setLabelUI() {
        navigationTitleLabel.font = .Pretendard(.semiBold, size: 28)
        navigationTitleLabel.textColor = .w1
        cardCountLabel.font = .cardnaB1Rg
        cardCountLabel.textColor = .w3
    }
    
    func setViewUI() {
        indicatorBarView.backgroundColor = .mainGreen
    }
    
    private func showBottomSheet() {
    
        guard let bottomSheetVC = UIStoryboard(name: "CardBottomSheet", bundle: nil).instantiateViewController(withIdentifier: "CardBottomSheetViewController") as? CardBottomSheetViewController else { return }
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: bottomSheetVC)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 221
        bottomSheet.adjustHeightForSafeAreaInsets = false
        
        self.present(bottomSheet, animated: true, completion: nil)
    }
    
    // MARK: - IBAction
    
    @IBAction func addCardButtonDidTap(_ sender: Any) {
        showBottomSheet()
    }
}

