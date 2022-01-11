//
//  CardBottomSheetViewController.swift
//  Cardna-iOS
//
//  Created by 이경민 on 2022/01/11.
//

import UIKit

class CardBottomSheetViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var cardAddBottomSheetView: UIView!
    
    // MARK: 카드나 작성 버튼
    @IBOutlet weak var addCardMeButton: UIButton!
    @IBOutlet weak var addCardMeIconImageView: UIImageView!
    @IBOutlet weak var addCardMeTitleLabel: UILabel!
    @IBOutlet weak var addCardMeExplainLabel: UILabel!
    
    // MARK: 카드너 추가 버튼
    @IBOutlet weak var addCardYouButton: UIButton!
    @IBOutlet weak var addCardYouIconImageView: UIImageView!
    @IBOutlet weak var addCardYouTitleLabel: UILabel!
    @IBOutlet weak var addCardYouExplainLabel: UILabel!
    
    // MARK: - VC LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    // MARK: - Function
    
    private func setLayout() {
        setBottomSheetView()
        setLabel()
    }
    
    private func setBottomSheetView() {
        cardAddBottomSheetView.layer.cornerRadius = 24
        cardAddBottomSheetView.backgroundColor = UIColor.darkGray
    }
    
    private func setLabel() {
        addCardMeTitleLabel.font = .Pretendard(.semiBold, size: 18)
        addCardMeTitleLabel.textColor = .w1
        addCardYouTitleLabel.font = .Pretendard(.semiBold, size: 18)
        addCardYouTitleLabel.textColor = .w1
        
        addCardMeExplainLabel.font = .Pretendard(.regular, size: 14)
        addCardMeExplainLabel.textColor = .w2
        addCardYouExplainLabel.font = .Pretendard(.regular, size: 14)
        addCardYouExplainLabel.textColor = .w2
    }
    
    // MARK: - IBAction
    @IBAction func addCardMeButtonDidTap(_ sender: Any) {
        print("\n\n눌림\n\n")
    }
    
    
    @IBAction func addCardYouButtonDidTap(_ sender: Any) {
        print("\n\n눌려씀\n\n")
    }
}
