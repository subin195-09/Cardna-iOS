//
//  CardViewController.swift
//  Cardna-iOS
//
//  Created by 김혜수 on 2022/01/09.
//

import UIKit

import MaterialComponents.MaterialBottomSheet

class CardViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var addCardButton: UIButton!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setLabelUI()
    }
    
    // MARK: - Function
    
    private func initialize() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setLabelUI() {
        navigationTitleLabel.font = .Pretendard(.semiBold, size: 28)
        navigationTitleLabel.textColor = .w1
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

