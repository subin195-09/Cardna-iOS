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
    
    // MARK: - IBOutlet
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    @IBOutlet weak var addCardButton: UIButton!
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setLabel()
    }
    
    // MARK: - Function
    
    private func initialize() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setLabel() {
        navigationTitleLabel.font = .Pretendard(.semiBold, size: 28)
        navigationTitleLabel.textColor = .w1
    }
    
    private func showBottomSheet() {
        let bottomSheetSB = UIStoryboard(name: "CardBottomSheet", bundle: nil)
        
        guard let bottomSheetVC = bottomSheetSB.instantiateViewController(withIdentifier: "CardBottomSheetViewController") as? CardBottomSheetViewController else { return }
        
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: bottomSheetVC)
        bottomSheet.mdc_bottomSheetPresentationController?.preferredSheetHeight = 221
        bottomSheet.adjustHeightForSafeAreaInsets = false
        
        self.present(bottomSheet, animated: true, completion: nil)
    }
    
    // MARK: - Objc Function
    
    // MARK: - IBAction
    @IBAction func addCardButtonDidTap(_ sender: Any) {
        showBottomSheet()
    }
    


}

