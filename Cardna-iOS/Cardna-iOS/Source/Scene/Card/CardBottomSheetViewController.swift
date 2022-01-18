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
        setBottomSheetViewUI()
        setLabelUI()
    }
    
    private func setBottomSheetViewUI() {
        cardAddBottomSheetView.layer.cornerRadius = 24
        cardAddBottomSheetView.backgroundColor = UIColor.darkGray
    }
    
    private func setLabelUI() {
        [addCardMeTitleLabel, addCardYouTitleLabel].forEach {
            $0?.font = .Pretendard(.semiBold, size: 18)
            $0?.textColor = .w1
        }
        
        [addCardMeExplainLabel, addCardYouExplainLabel].forEach {
            $0?.font = .Pretendard(.regular, size: 14)
            $0?.textColor = .w1
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func addCardMeButtonDidTap(_ sender: Any) {
        let nextVC = AddCardViewController()
        nextVC.isMe = true
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func addCardYouButtonDidTap(_ sender: Any) {
        guard let nextVC = UIStoryboard(name: "AddCardYouViewController", bundle: nil).instantiateViewController(withIdentifier: "AddCardYouViewController") as? AddCardYouViewController else { return }
        nextVC.modalPresentationStyle = .fullScreen
        self.present(nextVC, animated: true, completion: nil)
    }
}
